public class UpdateOpportunityCountAccount implements Queueable {
    set<Id> accIds = new set<Id>();
    List<Account> accountToUpdateList = new List<Account>();
    
    public UpdateOpportunityCountAccount(set<Id> accountId){
        accIds=accountId;
    }
    
    public void execute(QueueableContext cxt){
        for(AggregateResult agreResult : [select SUM(Amount) totalAmount,AccountId
                                          from Opportunity
                                          where AccountId IN: accIds
                                          Group By AccountId
                                         ]){
                                             Account acc = new Account();
                                             acc.Total_Opportunity_Amount__c  = (Decimal)agreResult.get('totalAmount');
                                             acc.Id = (Id)agreResult.get('AccountId');
                                             accountToUpdateList.add(acc);
                                         }
        if(!accountToUpdateList.isEmpty())
            update accountToUpdateList;
    }

}