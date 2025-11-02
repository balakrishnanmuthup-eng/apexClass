public class AccountTriggerHandler {
    List<Account> TriggerNew;
    List<Account> TriggerOld;
    Map<Id,Account> TriggerNewMap;
    Map<Id,Account> TriggerOldMap;
    
    public AccountTriggerHandler(){
        TriggerNew = (List<Account>)Trigger.New;
        TriggerOld = (List<Account>)Trigger.Old;
        TriggerNewMap = (Map<Id,Account>)Trigger.NewMap;
        TriggerOldMap = (Map<Id,Account>)Trigger.OldMap;
    }
    public void doAction(){
        Switch on Trigger.OperationType{
            
            When BEFORE_INSERT{
                
            }
            When BEFORE_UPDATE{
                
            }
            When AFTER_INSERT{
                //onAfterInsert();
            }
            When AFTER_UPDATE{
                onAfterUpdate();
            }
            When AFTER_DELETE{
                
            }
            When BEFORE_DELETE{
                onBeforeDelete();
            }
        }
    } 
    public void onAfterInsert(){
       // AccountHelper.createTask(TriggerNew);
       
    }
    public void onAfterUpdate(){
       // AccountHelper.createTaskForSalesRep(TriggerNew,TriggerOldMap);
       AccountHelper.createNumberofContactRelatedAccount(TriggerNew,TriggerOldMap);
        AccountHelper.updateAccountRelatedContactPhone(TriggerNew,TriggerOldMap);
        
    }
    public void onBeforeDelete(){
        AccountHelper.preventAccountDeletion(TriggerOld);
    }

}