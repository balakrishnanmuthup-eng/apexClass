public class OpportunityBatch implements Database.Batchable<SObject> {
    date today = system.today();
    public Database.QueryLocator start(Database.BatchableContext bc){
       // String query = 'select StageName,CloseDate,Name from Opportunity' +
          //  'Where CloseDate < :today';
        return Database.getQueryLocator([select StageName,CloseDate,Name from Opportunity
                                        where StageName != 'Closed Won' AND StageName != 'Closed Lost' AND CloseDate < :today]);
        
    }
    public void execute(Database.BatchableContext bc,List<Opportunity> scope){
        for(Opportunity record : scope){
            record.StageName = 'Closed Lost';
        }
        List<Database.SaveResult> saveresult = Database.update(scope,false);
        for(Database.SaveResult sr : saveresult){
            if(sr.isSuccess()){
                system.debug('records are successfully updated'+sr.getId());
            } else {
                for (Database.Error err : sr.getErrors()) {
                    System.debug('Error: ' + err.getMessage());
                }
            }
            
        }
    }
    public void finish(Database.BatchableContext bc){
        AsyncApexJob lst =[select Id,Status,NumberofErrors,TotalJobItems
                           from AsyncApexJob
                           where Id =: bc.getJobId()
                          ];
        string toAddress=label.EmailLabel;
        string subject='opportunity batch apex';
        string body='Hi batch job status </br>';
        body+='</br> Status ::'+lst.Status;
        body+='</br> Number of Error ::'+lst.NumberofErrors;
        body+='</br> Total Jobs ::'+lst.TotalJobItems;
        EmailHelper.doSendEmail( subject, body, toAddress);
    }

}