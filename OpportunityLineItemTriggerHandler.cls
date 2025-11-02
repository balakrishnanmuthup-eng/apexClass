public class OpportunityLineItemTriggerHandler {
    List<OpportunityLineItem> TriggerNew;
    List<OpportunityLineItem> TriggerOld;
    Map<Id,OpportunityLineItem> TriggerNewMap;
    Map<Id,OpportunityLineItem> TriggerOldMap;
    
    public OpportunityLineItemTriggerHandler(){
        TriggerNew = (List<OpportunityLineItem>)Trigger.New;
        TriggerOld = (List<OpportunityLineItem>)Trigger.Old;
        TriggerNewMap = (Map<Id,OpportunityLineItem>)Trigger.NewMap;
        TriggerOldMap = (Map<Id,OpportunityLineItem>)Trigger.OldMap;
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
                onAfterDelete();
            }
            When BEFORE_DELETE{
               
            }
        }
    } 
    public void onAfterInsert(){
       OpportunityLineItemHelper.updateOpportunityProductCode(TriggerNew);
    }
    public void onAfterUpdate(){
       OpportunityLineItemHelper.updateOpportunityProductCode(TriggerNew);
    }
    public void onAfterDelete(){
       OpportunityLineItemHelper.updateOpportunityProductCode(TriggerOld);
    }
}