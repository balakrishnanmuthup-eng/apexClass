public class ContactHelper {
    Static List<Contact_Relationship__c> contactRelationshipList = new List<Contact_Relationship__c>();
    
    public static void updateCountOfContactRelatedAccount(List<Contact> conList){
        List<Account> accountToUpdateList = new List<Account>();
        set<Id> accountIds = new set<Id>();
        for(Contact contactRecord : conList){
            if(contactRecord.AccountId != Null){
                accountIds.add(contactRecord.AccountId);
            }
        }
        if(accountIds.size() > 0){
            List<Account> accountContactCountList = [select Name,Count_of_Contact__c,
                                                     (select AccountId From Contacts)
                                                     from Account
                                                     where Id IN: accountIds
                                                    ];
            for(Account AccountRecord : accountContactCountList){
                AccountRecord.Count_of_Contact__c = AccountRecord.Contacts.size();
                accountToUpdateList.add(AccountRecord);
            }
        }
        if(!accountToUpdateList.isEmpty())
            update accountToUpdateList;
    }
    public static void createContactRelationshipRelatedContact(List<Contact> conList){
        List<Contact_Relationship__c> contactRelationshipList = new List<Contact_Relationship__c>();
        for(Contact contactRecord : conList){
            if(contactRecord.Contact_Relationship__c == true){
                Contact_Relationship__c conRelationship = new Contact_Relationship__c();
                conRelationship.Name = contactRecord.LastName;
                conRelationship.ContactId__c = contactRecord.Id;
                contactRelationshipList.add(conRelationship);
            }
        }
        if(!contactRelationshipList.isEmpty())
            insert contactRelationshipList;
    }
    public static void beforeDeleteRelateContactRelatioship(List<Contact> conOld){
        contactRelationshipList = [select Id,Name
                                   From Contact_Relationship__c
                                   where ContactId__c IN: conOld
                                  ];
    }
    public static void AfterDeleteRelateContactRelatioship(List<Contact> conOld){
        if(contactRelationshipList.size() > 0)
            delete contactRelationshipList;
    }
    public static void AfterUnDeleteRelateContactRelatiosnhip(List<Contact> conList){
        Map<Id,Contact> contactMap = new Map<Id,Contact>();
        for(Contact contactRecord : conList){ 
                contactMap.put(contactRecord.id,contactRecord);
        }
        if(contactMap.size() > 0){
            List<Contact_Relationship__c> conRelationList = [select ContactId__c
                                                             from Contact_Relationship__c
                                                             where ContactId__c IN: contactMap.keyset() AND isDeleted =true
                                                             ALL ROWS
                                                            ];
            if(!conRelationList.isEmpty())
                undelete conRelationList;
                                                               
        }
    }  
}