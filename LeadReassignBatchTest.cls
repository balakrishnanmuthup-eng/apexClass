@isTest
public class LeadReassignBatchTest {
    
    @TestSetup
    public static void doSetup(){
        List<Lead> leadList = new List<Lead>();
        
        for(Integer i=1;i<=200;i++){
            Lead leadRecord = new Lead();
            leadRecord.LastName = 'Test Setup '+i;
            leadRecord.Status = 'Working - Contacted';
            leadRecord.Company = 'Test';
            leadRecord.OwnerId = userInfo.getUserId();
            leadList.add(leadRecord);
        }
        
        if(!leadList.isEmpty())
            insert leadList;
        
        List<Task> taskList = new List<Task>();
        
        for(Lead record : [select Id,LastName,OwnerId from Lead]){
            Task tk = new Task();
            tk.WhoId = record.Id;
            tk.ActivityDate = system.Today().addDays(-10);
            tk.Status = 'Completed';
            tk.OwnerId = record.OwnerId;
            tk.Subject = record.LastName;
            taskList.add(tk);
        }
        
        if(!taskList.isEmpty())
            insert taskList;
    }
    @isTest
    public static void doTest(){
        Test.StartTest();
        Database.executebatch(new LeadReassignBatch(),200);
        Test.StopTest();
        List<Lead> leadLst =[select LastName,ownerId  
                                         from Lead
                                         where ownerId = '005dM00000GOp8DQAT'
                                        ];
        Assert.areEqual(200,leadLst.size(),'unable to update');
        List<Task> taskLst =[select Id,ActivityDate 
                             from Task
                             where Status = 'Not Started' AND ActivityDate =: system.Today()
                            ];
        Assert.areEqual(200,taskLst.size(),'unable to insert');
    }
}