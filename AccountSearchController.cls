public  class AccountSearchController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchKey) {
        return [
            SELECT Id, Name, AccountNumber, BillingState
            FROM Account
            WHERE Name LIKE :('%' + searchKey + '%')
        ];
    }
}