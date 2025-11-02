public class OpportunityTriggerHandler {
    List<Opportunity> TriggerNew;
    List<Opportunity> TriggerOld;
    Map<Id,Opportunity> TriggerNewMap;
    Map<Id,Opportunity> TriggerOldMap;
    
    public OpportunityTriggerHandler(){
        TriggerNew = (List<Opportunity>)Trigger.New;
        TriggerOld = (List<Opportunity>)Trigger.Old;
        TriggerNewMap = (Map<Id,Opportunity>)Trigger.NewMap;
        TriggerOldMap = (Map<Id,Opportunity>)Trigger.OldMap;
    }
    public void doAction(){
        Switch on Trigger.OperationType{
            
            When BEFORE_INSERT{
                
            }
            When BEFORE_UPDATE{
                
            }
            When AFTER_INSERT{
                onAfterInsert();
            }
            When AFTER_UPDATE{
                onAfterUpdate();
            }
            When AFTER_DELETE{
                
            }
        }
    } 
    public void onAfterInsert(){
       // OpportunityHelper.createTask(TriggerNew);
       OpportunityHelper.createUpdateOpportunityCountRelatedAccount(TriggerNew,Null);
    }
    public void onAfterUpdate(){
        OpportunityHelper.createTaskForSalesRep(TriggerNew,TriggerOldMap);
        OpportunityHelper.createUpdateOpportunityCountRelatedAccount(TriggerNew,TriggerOldMap);
        
    }
    

}