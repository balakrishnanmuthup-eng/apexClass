public class TaskHelper {
    
    public static void updateOpportunityStage(List<Task> taskList,Map<Id,Task> taskOldMap){
        set<Id> oppIds = new set<Id>();
        List<Opportunity> opportunityList = new List<Opportunity>();
        for(Task taskRecord: taskList){
            system.debug('in for task :: '+taskRecord);
            if(taskRecord.Status != taskOldMap.get(taskRecord.Id).Status && taskRecord.Closed_Won__c !=  taskOldMap.get(taskRecord.Id).Closed_Won__c){
                system.debug('in if task :: '+taskRecord);
                if(taskRecord.Status == 'Completed'){
                    oppIds.add(taskRecord.WhatId);
                    system.debug('in if task :: '+taskRecord);
                    system.debug('in if what id :: '+oppIds);
                }
            }
        }
        if(oppIds.size() > 0){
            system.debug('in if null what id :: '+oppIds);
            for(Opportunity opportunityRecord : [select Name,StageName
                                                 from Opportunity
                                                 where Id IN: oppIds
                                                ]){
                                                    system.debug('in for opportunity  :: '+opportunityRecord);
                                                    opportunityRecord.StageName = 'Closed Won';
                                                    opportunityList.add(opportunityRecord);
                                                }
        }
        if(!opportunityList.isEmpty())
            update opportunityList;
    }

}