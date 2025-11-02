public class ContactTriggerHandler {
    List<Contact> TriggerNew;
    List<Contact> TriggerOld;
    Map<Id,Contact> TriggerNewMap;
    Map<Id,Contact> TriggerOldMap;
    
    public ContactTriggerHandler(){
        TriggerNew = (List<Contact>)Trigger.New;
        TriggerOld = (List<Contact>)Trigger.Old;
        TriggerNewMap = (Map<Id,Contact>)Trigger.NewMap;
        TriggerOldMap = (Map<Id,Contact>)Trigger.OldMap;
    }
    public void doAction(){
        Switch on Trigger.OperationType{
            
            When BEFORE_INSERT{
                
            }
            When BEFORE_UPDATE{
                
            }
            When BEFORE_DELETE{
                onBeforeDelete();
            }
            When AFTER_INSERT{
                onAfterInsert();
            }
            When AFTER_UPDATE{
                
            }
            When AFTER_DELETE{
                onAfterDelete();
            }
            When AFTER_UNDELETE{
                onAfterUnDelete();
            }
        }
    } 
    public void onAfterUpdate(){
        
    }
    public void onAfterInsert(){
        ContactHelper.updateCountOfContactRelatedAccount(TriggerNew);
        ContactHelper.createContactRelationshipRelatedContact(TriggerNew);
    }
    public void onAfterDelete(){
        ContactHelper.updateCountOfContactRelatedAccount(TriggerOld);
        ContactHelper.AfterDeleteRelateContactRelatioship(TriggerOld);
    }
    Public void onBeforeDelete(){
        ContactHelper.beforeDeleteRelateContactRelatioship(TriggerOld);
    }
    Public void onAfterUnDelete(){
        ContactHelper.AfterUnDeleteRelateContactRelatiosnhip(TriggerNew);
    }

}