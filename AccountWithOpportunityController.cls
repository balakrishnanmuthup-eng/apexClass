public with sharing class AccountWithOpportunityController {

    @AuraEnabled(cacheable=true)
    public static List<ResultWrapper> getAccountWithOpp() {
        List<ResultWrapper> resultList = new List<ResultWrapper>();
        for(Account acc : [Select Id, Name,BillingCountry, (Select Id from Opportunities) from Account where ownerId = :UserInfo.getUserId()]){
            ResultWrapper result = new ResultWrapper();
            result.nameurl='/'+acc.id;
            result.accountId=acc.id;
            result.accountName=acc.Name;
            result.country=acc.BillingCountry;
            result.numberOfOpp=acc.Opportunities.size();
            resultList.add(result);
        }
        return resultList;
    }
    @AuraEnabled
    public static void deleteAccountWithOpp(String accountId){
        for(Account acc : [Select Id,(Select Id from Opportunities where isclosed = false) from Account where Id = :accountId]){
            if(acc.Opportunities.size() > 0){
                throw new AuraHandledException('You cannot delete this account because it has open opportunities.');
            }else{
                try {
                    delete acc ;
                } catch (Exception e) {
                    throw new AuraHandledException(e.getMessage());
                }
            }
        }
        
    }
    
    public class ResultWrapper {

        @AuraEnabled
        public string nameurl;
        
        @AuraEnabled
        public string accountName;

        @AuraEnabled
        public string country;

        @AuraEnabled
        public integer numberOfOpp;

        @AuraEnabled
        public string accountId;
    }
}