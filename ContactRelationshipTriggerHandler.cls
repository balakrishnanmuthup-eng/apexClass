public class ContactRelationshipTriggerHandler {
    
    List<Contact_Relationship__c> TriggerNew;
    List<Contact_Relationship__c> TriggerOld;
    Map<Id,Contact_Relationship__c> TriggerNewMap;
    Map<Id,Contact_Relationship__c> TriggerOldMap;
    
    public ContactRelationshipTriggerHandler(){
        TriggerNew = (List<Contact_Relationship__c>)Trigger.New;
        TriggerOld = (List<Contact_Relationship__c>)Trigger.Old;
        TriggerNewMap = (Map<Id,Contact_Relationship__c>)Trigger.NewMap;
        TriggerOldMap = (Map<Id,Contact_Relationship__c>)Trigger.OldMap;
    }
    public void doAction(){
        Switch on Trigger.OperationType{
            
            When BEFORE_INSERT{
                
            }
            When BEFORE_UPDATE{
                onBeforeUpdate();
            }
            When AFTER_INSERT{
                
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
       
       
    }
    public void onAfterUpdate(){
       
    }
    public void onBeforeUpdate(){
      ContactRelationshipHelper.updateNameFromOwner(TriggerNew,TriggerOldMap);
    }

}