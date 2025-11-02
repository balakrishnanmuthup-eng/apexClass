public class OpportunityHelper {
    public static void createTask(List<Opportunity> oppList){
        List<Task> taskList = new List<Task>();
        for(Opportunity opportunityRecord : oppList){
            if(opportunityRecord.Id != null){
                Task createTask = new Task();
                createTask.WhatId = opportunityRecord.Id;
                createTask.OwnerId = opportunityRecord.OwnerId;
                createTask.Status = 'Not Started';
                createTask.Subject = 'Follow up';
                taskList.add(createTask);
            }
        }
        if(!taskList.isEmpty())
            insert taskList;
    }
    public static void createTaskForSalesRep(List<Opportunity> oppList,Map<Id,Opportunity> oppOldMap){
        List<Task> taskList = new List<Task>();
        List<Opportunity> opportunityList = new List<Opportunity>();
        Map<Id,User> userMap = new Map<Id,User>([select Id,Name From User where isActive = true]);
        for(Opportunity opportunityRecord : oppList){
            if(!OpportunityRecursive.OpportunityIds.contains(opportunityRecord.Id)){
                OpportunityRecursive.OpportunityIds.add(opportunityRecord.Id);
                opportunityList.add(opportunityRecord);
            }
        }
        for(Opportunity opportunityRecord : opportunityList){
            if(opportunityRecord.Id != null && 
               opportunityRecord.StageName != oppOldMap.get(opportunityRecord.Id).StageName && 
               opportunityRecord.StageName == 'Closed Won' && opportunityRecord.Sales_Rep__c != Null){
                   
                       Task createTask = new Task();
                       createTask.WhatId = opportunityRecord.Id;
                       createTask.OwnerId = opportunityRecord.Sales_Rep__c;
                       createTask.ActivityDate = opportunityRecord.CloseDate.addDays(2);
                       createTask.Status = 'Not Started';
                       createTask.Subject = 'Follow up Opportunity';
                       createTask.Description = 'Hi'+ userMap.get(createTask.OwnerId).Name +'\n Please follow the opportunity by making a call to the customer';
                       taskList.add(createTask);
                   }
               }
        
        if(!taskList.isEmpty())
            insert taskList;
    }
    public static void createUpdateOpportunityCountRelatedAccount(List<Opportunity> oppList,Map<Id,Opportunity> oppOldMap){
        set<Id> accountIds = new set<Id>();
        for(Opportunity opportunityRecord : oppList){
            if(opportunityRecord.AccountId != Null && opportunityRecord.Amount != Null && 
                (oppOldMap == null || oppOldMap.get(opportunityRecord.Id).Amount != opportunityRecord.Amount)){
                accountIds.add(opportunityRecord.AccountId);
            }
        }
        if(accountIds.size() > 0)
            system.enqueueJob(new UpdateOpportunityCountAccount(accountIds));
    }
    
}