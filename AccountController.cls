public  class AccountController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsBasedRating(String Rating) {
        return [Select Id, Name, Rating 
                from Account 
                where Rating=:Rating];
    }
}