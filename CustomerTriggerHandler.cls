public class CustomerTriggerHandler {
    
    List<Customer__c> TriggerNew;
    List<Customer__c> TriggerOld;
    Map<Id,Customer__c> TriggerNewMap;
    Map<Id,Customer__c> TriggerOldMap;
    
    public CustomerTriggerHandler(){
        TriggerNew = (List<Customer__c>)Trigger.New;
        TriggerOld = (List<Customer__c>)Trigger.Old;
        TriggerNewMap = (Map<Id,Customer__c>)Trigger.NewMap;
        TriggerOldMap = (Map<Id,Customer__c>)Trigger.OldMap;
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
                
            }
            When AFTER_DELETE{
                
            }
            When BEFORE_DELETE{
               
            }
        }
    } 
    public void onAfterInsert(){
       CustomerHelper.insertAccountTeamRelatedAccount(TriggerNew);
       
    }
}