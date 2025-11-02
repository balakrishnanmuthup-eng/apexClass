public class TaskTriggerHandler {
    List<Task> TriggerNew;
    List<Task> TriggerOld;
    Map<Id,Task> TriggerNewMap;
    Map<Id,Task> TriggerOldMap;
    
    public TaskTriggerHandler(){
        TriggerNew = (List<Task>)Trigger.New;
        TriggerOld = (List<Task>)Trigger.Old;
        TriggerNewMap = (Map<Id,Task>)Trigger.NewMap;
        TriggerOldMap = (Map<Id,Task>)Trigger.OldMap;
    }
    public void doAction(){
        Switch on Trigger.OperationType{
            
            When BEFORE_INSERT{
                
            }
            When BEFORE_UPDATE{
                
            }
            When AFTER_INSERT{
                
            }
            When AFTER_UPDATE{
                onAfterUpdate();
            }
            When AFTER_DELETE{
                
            }
        }
    } 
    public void onAfterUpdate(){
        TaskHelper.updateOpportunityStage(TriggerNew,TriggerOldMap);
    }

}