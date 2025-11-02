public class LeadReassignBatch implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
       
        return Database.getQueryLocator([select LastName,Status,Days_Since_Last_Activity__c  
                                         from Lead
                                         where Days_Since_Last_Activity__c > 5
                                        ]);
    }
    
    public void execute(Database.BatchableContext bc,List<Lead> leadList){
        List<Lead> leadsList = new List<Lead>();
        List<Task> taskList = new List<Task>();
        user ur = [select Id,LastName from user where profile.Name = 'Sales Manager' AND LastName = 'Ajith'];
        for(Lead leadRecord : leadList ){
            leadRecord.OwnerId = ur.Id;
            leadsList.add(leadRecord);
            
            Task taskRecord = new Task();
            taskRecord.WhoId = leadRecord.Id;
            taskRecord.ActivityDate = system.Today();
            taskRecord.Status = 'Not Started';
            taskRecord.OwnerId = leadRecord.OwnerId;
            taskRecord.Subject = 'Last Activity Morethan 5 Days';
            taskList.add(taskRecord);
            
        }
        if(!leadsList.isEmpty()){
            List<Database.SaveResult> saveresult = Database.update(leadsList,false);
            for(Database.SaveResult sr : saveresult){
                if(sr.isSuccess()){
                    system.debug('records are successfully updated :: '+sr.getId());
                } else {
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('Error :: ' + err.getMessage());
                    }
                } 
            }
        }
        
        if(!taskList.isEmpty()){
            List<Database.SaveResult> saveresult = Database.insert(taskList,false);
            for(Database.SaveResult sr : saveresult){
                if(sr.isSuccess()){
                    system.debug('records are successfully Inserted :: '+sr.getId());
                } else {
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('Error :: ' + err.getMessage());
                    }
                } 
            } 
        }    
    }
    
    public void finish(Database.BatchableContext bc){
        AsyncApexJob lst =[select Id,Status,NumberofErrors,TotalJobItems
                           from AsyncApexJob
                           where Id =: bc.getJobId()
                          ];
        string toAddress=label.EmailLabel;
        string subject='leadupdate batch apex';
        string body='Hi Lead batch job </br>';
        body+='</br> Status ::'+lst.Status;
        body+='</br> Number of Error ::'+lst.NumberofErrors;
        body+='</br> Total Jobs ::'+lst.TotalJobItems;
        EmailHelper.doSendEmail( subject, body, toAddress);

    }

}