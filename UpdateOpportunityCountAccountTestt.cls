@istest
public class UpdateOpportunityCountAccountTestt {
    
    @TestSetup
    public static void doTestSetup(){
        
        Account acc = new Account();
        acc.Name = 'sum amount';
        insert acc;
        
    }
    @isTest
    public static void doTest(){
        Account accRec = [select Name From Account where Name = 'sum amount'];
       List<opportunity> oppList = new List<opportunity>();
       oppList.add(new Opportunity(Name = 'test1',CloseDate = system.Today(),StageName = 'Prospecting',Sales_Rep__c = '005dM00000GOp8DQAT',Amount = 100000,AccountId=accRec.Id));
       oppList.add(new Opportunity(Name = 'test2',CloseDate = system.Today(),StageName = 'Prospecting',Sales_Rep__c = '005dM00000GOp8DQAT',Amount =60000,AccountId=accRec.Id));
       
        Test.StartTest();
        
        Insert oppList;
        List<Opportunity> oppRecList = [select Amount,AccountId from Opportunity Where AccountId =: accRec.Id];
       
        oppRecList[1].Amount = 80000;
        oppRecList[1].StageName = 'Closed Won';
        update oppRecList[1];
        
        Test.StopTest();
        
        Account updatedAcc = [SELECT Id, Total_Opportunity_Amount__c FROM Account WHERE Id = :accRec.Id];
        Assert.areEqual(180000,updatedAcc.Total_Opportunity_Amount__c,'unable to creaete opportunity');
    }
}