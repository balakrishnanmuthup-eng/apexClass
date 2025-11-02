public class AccountHelper {
    public static void preventAccountDeletion(List<Account> accOldList){
        User testUser = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator' AND IsActive = TRUE LIMIT 1];
        for(Account accountRecord : accOldList){
            if(testUser.Id != userInfo.getUserId()){
                accountRecord.addError('Cannot delete The Account by all Users');
            }
            
        }
    }
    public static void createNumberofContactRelatedAccount(List<Account> accList,Map<Id,Account> accOldMap){
        Map<Id,Account> accountMap = new Map<Id,Account>();
        List<Contact> contactList = new List<Contact>();
        for(Account accountRecord : accList){
            system.debug('account in for'+accountRecord);
            if(accountRecord.Number_O_Location__c  != accOldMap.get(accountRecord.Id).Number_O_Location__c ){
                accountMap.put(accountRecord.Id,accountRecord);
                system.debug('account map in if'+accountMap);
            }
        }
        system.debug('account map in '+accountMap);
        if(accountMap.size() > 0){
            /*for(Contact contactRecord : [select AccountId
                                         from Contact
                                         where AccountId IN: accountMap.keyset()
                                        ]){
                                            system.debug('Contact count '+contactList.size());
                                            system.debug('Contact Record'+contactRecord);
                                            if(contactList.size()<accountMap.get(contactRecord.AccountId).Number_O_Location__c  || contactList.size() == null){
                                                   contact con = new contact();
                                                   con.LastName = accountMap.get(con.AccountId).Name + accountMap.get(con.AccountId).Number_O_Location__c ;
                                                   con.AccountId =  accountMap.get(contactRecord.AccountId).Id;
                                                   contactList.add(con);
                                                   system.debug('Contact Record'+contactRecord);
                                                   system.debug('Contact count'+contactList.size());
                                               }
                                        }*/
            for(Integer count = 0; count < accountMap.values().Number_O_Location__c ;count++){
                Contact con = new contact();
                con.LastName = accountMap.values().Name + accountMap.values().Number_O_Location__c ;
                con.AccountId =  accountMap.values().Id;
                contactList.add(con);
            }
        }
        if(!contactList.isEmpty())
            insert contactList;
    }
    public static void updateAccountRelatedContactPhone(List<Account> accList,Map<Id,Account> accOldMap){
        Map<Id,Account> accountMap = new Map<Id,Account>();
        for(Account AccountRecord : accList){
            if(AccountRecord.Phone != accOldMap.get(AccountRecord.Id).Phone){
                accountMap.put(AccountRecord.Id,AccountRecord);
            }
        }
        ContactFuture.updateContactPhone(JSON.serialize(accountMap));
    }
}