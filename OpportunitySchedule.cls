public class OpportunitySchedule implements Schedulable {
    public void execute(SchedulableContext ctx){
        Database.executeBatch(new OpportunityBatch(),20);
    }

}