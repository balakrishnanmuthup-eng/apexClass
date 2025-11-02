public class AccountUtility{
    
    public static Integer getAccountsRelatedChild(){ 
        
        List<Account> accList=[Select Name, (Select LastName from Contacts), (Select Name, StageName, Amount from Opportunities) From Account];
        Integer contactCount=0, opportunityCount=0, totalChildRecords=0;
        for(Account acc:accList){
            if(acc.contacts.size()>0){
                contactCount=acc.contacts.size();
            } 
            if(acc.opportunities.size()>0){
                opportunityCount=acc.opportunities.size();
            }  
        }
        totalChildRecords=contactCount+opportunityCount;
        Return totalChildRecords;
    }
    
    //Status is custom picklist filed
   /* public static Integer clearAccount()
    {
        Delete [Select Name from Account where status__c = 'Inactive'];
    }*/
}