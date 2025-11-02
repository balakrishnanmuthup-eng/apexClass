public class CustomerProjectTriggerHandler {
    List<Customer_Project__c> TriggerNew;
    List<Customer_Project__c> TriggerOld;
    Map<Id,Customer_Project__c> TriggerNewMap;
    Map<Id,Customer_Project__c> TriggerOldMap;
    
    public CustomerProjectTriggerHandler(){
        TriggerNew = (List<Customer_Project__c>)Trigger.New;
        TriggerOld = (List<Customer_Project__c>)Trigger.Old;
        TriggerNewMap = (Map<Id,Customer_Project__c>)Trigger.NewMap;
        TriggerOldMap = (Map<Id,Customer_Project__c>)Trigger.OldMap;
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
        }
    } 
    public void onAfterInsert(){
        CustomerProjectHelper.updateOpportunityRelatedCustomerProject(TriggerNew);
    }

}