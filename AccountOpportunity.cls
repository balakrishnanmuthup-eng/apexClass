public class AccountOpportunity {
    public static void searchAccountAndOpportunity(String accountAndOpportunityName){
        List<List<SObject>> searchAccountOpportunityList =[FIND :accountAndOpportunityName 
                                                           IN NAME FIELDS
                                                           Returning Account(Name,Rating Where Rating = 'Hot'),
                                                           Opportunity(Name,CloseDate,StageName)
                                                          ];
        Account[] searchAccount = (Account[])searchAccountOpportunityList[0];
        Opportunity[] searchOpportunity = (Opportunity[])searchAccountOpportunityList[1];
        for(Account accountRecord : searchAccount){
            system.debug(' :::::::::::::::::::::::: Account  :::::::::::::::::::::::::::');
            system.debug(' :: Account Name       ::' + accountRecord.Name);
            system.debug(' :: Account Rating     ::' + accountRecord.Rating);
            system.debug(' :: Account Id         ::' + accountRecord.Id);
            system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
            system.debug('                                                             ');
        }
        for(Opportunity opportunityRecord : searchOpportunity){
            system.debug(' :::::::::::::::::::: All Opportunity  :::::::::::::::::::::');
            system.debug(' :: Opportunity Name       ::' + opportunityRecord.Name);
            system.debug(' :: Opportunity CloseDate  ::' + opportunityRecord.CloseDate);
            system.debug(' :: Opportunity Stage      ::' + opportunityRecord.StageName);
            system.debug(' :: Opportunity Id         ::' + opportunityRecord.Id);
            system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
            system.debug('                                                             ');
        }
    }
    public static void leadAndContact(){
        List<List<SObject>> leadAndContact =[FIND 'Arunkumar or Aravind'
                                             IN NAME FIELDS
                                             Returning Lead(LastName,Phone),
                                             Contact(LastName,Phone)
                                            ];
        List<Lead> leadList =(List<Lead>)leadAndContact[0];
        if(!leadList.isEmpty()){
            for(Lead record : leadList){
                system.debug('Lead Name  :: '+record.LastName);
                system.debug('Lead Phone :: '+record.Phone);
            }
        }else{
            system.debug('There is No Record Available ');
        }
        
        List<contact> contactList =(List<contact>)leadAndContact[1];
        if(!contactList.isEmpty()){
            for(contact con : contactList){
                system.debug('contact Name  :: '+con.LastName);
                system.debug('contact Phone :: '+con.Phone);
            }
        }else{
            system.debug('There is No Record Available ');
        }
    }
    public static void nameOfAccountAndContact(){
        List<Account> AccountList = [select Name
                                     from Account
                                    ];
        Map<Id,Account> accountMap = new  Map<Id,Account>();
        for(account accoutRecord : AccountList){
            accountMap.put(accoutRecord.Id,accoutRecord);
        }
        for(Contact contactRecord : [select LastName,AccountId
                                     from Contact
                                     where AccountId IN: accountMap.keyset()
                                    ]){
                                        if(accountMap.containskey(contactRecord.AccountId)){
                                            system.debug('::::::::::::: Account Record  :::::::::::::::');
                                            system.debug('contact Name  :: '+ accountMap.get(contactRecord.AccountId).Name);
                                            system.debug('::::::::::::: ::::::::::::::  :::::::::::::::');
                                            system.debug('                                              ');
                                            system.debug('::::::::::::: Related Contact  :::::::::::::::');
                                            system.debug('::::::::::::: Contact Record  :::::::::::::::');
                                            system.debug('contact Name  :: '+contactRecord.LastName);
                                            system.debug('::::::::::::: ::::::::::::::  :::::::::::::::');
                                            system.debug('                                              ');
                                            
                                        }
                                    }
    }
    public static void countRecord(){
        List<AggregateResult> counter = [select count(Id) recordCount
                                      from Opportunity
                                          ];
        system.debug('List of Total count of Opportunity ' + counter);
        for(AggregateResult record : [select count(Id) recordCount
                                      from Opportunity
                                          ]){
                                              system.debug('Total count of Opportunity ' + record.get('recordCount'));
                                          }
    }
    public static void opportunityAmount(){
        Map<Id,Account> accountMap = new Map<Id,Account>();
        for(Account accountRecord : [select Name,Id
                                     from Account
                                     where Name = 'Ac02'
                                    ]){
                                        accountMap.put(accountRecord.Id,accountRecord);
                                    }

        for(AggregateResult record : [select sum(amount) sumAmount
                                      from Opportunity
                                      where AccountId =: accountMap.keyset()
                                      Group by AccountId
                                     ]){
                                         system.debug('Total Opportunity opportunity amount :: ' + record.get('sumAmount') );
                                     }
    }
        public static void opportunityStageCount(){

        for(AggregateResult record : [select count(Id) countRecord,StageName
                                      from Opportunity
                                      Group by StageName
                                      order by StageName Asc
                                     ]){
                                         system.debug('Stage Name  :: ' + record.get('StageName')+' :: '+
                                                      ' Total Count :: ' + record.get('countRecord'));
                                     }
    }
}