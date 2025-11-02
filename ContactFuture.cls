public class ContactFuture {
    
    @future
    public static void updateContactPhone(string account){
        List<Contact> contactList = new List<Contact>();
        Map<Id,Account> accountMap = (Map<Id,Account>)JSON.deserialize(account,Map<Id,Account>.class);
        for(Contact contactRecord : [select AccountId,Phone
                                     from Contact
                                     Where AccountId IN: accountMap.keyset()
                                    ]){
                                        if(accountMap.containskey(contactRecord.AccountId)){
                                            contactRecord.Phone = accountMap.get(contactRecord.AccountId).Phone;
                                            contactList.add(contactRecord);
                                        }
                                    }
        if(!contactList.isEmpty())
            update contactList;
    }
}