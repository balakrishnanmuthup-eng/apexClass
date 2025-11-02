public class CustomerHelper {
    public static void insertAccountTeamRelatedAccount(List<Customer__c> customList){
        List<AccountTeamMember> accTeamList = new List<AccountTeamMember>();
        for(Customer__c customerRecord : customList){
            if(customerRecord.AccountId__c != Null && customerRecord.Account_Manager__c != Null){
                
                AccountTeamMember accTeam = new AccountTeamMember();
                accTeam.AccountId = customerRecord.AccountId__c;
                accTeam.UserId = customerRecord.Account_Manager__c;
                accTeam.TeamMemberRole = 'Account Manager';
                accTeamList.add(accTeam);
            }
        }
        if(!accTeamList.isEmpty())
            insert accTeamList;
    }
}