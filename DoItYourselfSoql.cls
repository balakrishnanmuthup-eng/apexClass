public class DoItYourselfSoql {
    
    public static void displayAllOpportunity(){
        for(Opportunity opp :[SELECT Id,Name ,CloseDate,StageName FROM Opportunity]){
            system.debug(' :::::::::::::::::::: All Opportunity  :::::::::::::::::::::');
            system.debug(' :: Opportunity Name       ::' + opp.Name);
            system.debug(' :: Opportunity CloseDate  ::' + opp.CloseDate);
            system.debug(' :: Opportunity Stage      ::' + opp.StageName);
            system.debug(' :: Opportunity Id         ::' + opp.Id);
            system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
            system.debug('                                                             ');
        }
    }
    
    public static void displayGreaterthanAmount(decimal inputAmount){
        for(Opportunity Opp :[SELECT Id,Name,CloseDate,StageName,Amount
                              FROM Opportunity
                              WHERE amount >: inputAmount
                             ]){
                                 system.debug(' :::::::::::::::::::: All Opportunity  :::::::::::::::::::::');
                                 system.debug(' :: Opportunity Name       ::' + Opp.Name);
                                 system.debug(' :: Opportunity CloseDate  ::' + Opp.CloseDate);
                                 system.debug(' :: Opportunity Stage      ::' + Opp.StageName);
                                 system.debug(' :: Opportunity Id         ::' + Opp.Id);
                                 system.debug(' :: Opportunity Amount     ::' + Opp.Amount);
                                 system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
                                 system.debug('                                                             ');
                             }
    }
    
    public static void displayOpportunityStage(String Stage){
        Integer countNoOfOpportunity=0;
        for(Opportunity Opp :[SELECT Id,Name,CloseDate,StageName,Amount
                              FROM Opportunity
                              WHERE StageName =: Stage
                             ]){
                                 countNoOfOpportunity++;
                                 system.debug(' :::::::::::::::::::: All Opportunity  :::::::::::::::::::::');
                                 system.debug(' :: Opportunity Name       ::' + Opp.Name);
                                 system.debug(' :: Opportunity CloseDate  ::' + Opp.CloseDate);
                                 system.debug(' :: Opportunity Stage      ::' + Opp.StageName);
                                 system.debug(' :: Opportunity Id         ::' + Opp.Id);
                                 system.debug(' :: Opportunity Amount     ::' + Opp.Amount);
                                 system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
                                 system.debug('                                                             ');
                             }
        system.debug(' :: Total Opportunity available in ::' + Stage + ' :: ' + countNoOfOpportunity);
    }
    
    public static void displayOpportunityStageAndLeadsource(String stage,String lead){
        for(Opportunity Opp :[SELECT Id,Name,CloseDate,StageName,Amount,LeadSource
                              FROM Opportunity
                              WHERE StageName =: Stage AND
                              LeadSource =: lead
                             ]){
                                 system.debug(' :::::::::::::::::::: All Opportunity  :::::::::::::::::::::');
                                 system.debug(' :: Opportunity Name       ::' + Opp.Name);
                                 system.debug(' :: Opportunity CloseDate  ::' + Opp.CloseDate);
                                 system.debug(' :: Opportunity Stage      ::' + Opp.StageName);
                                 system.debug(' :: Opportunity LeadSource      ::' + Opp.LeadSource);
                                 system.debug(' :: Opportunity Id         ::' + Opp.Id);
                                 system.debug(' :: Opportunity Amount     ::' + Opp.Amount);
                                 system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
                                 system.debug('                                                             ');
                             }
    }
    
    public static void displayOpportunityNameStart(String inputName){
        for(Opportunity opp : [SELECT Id,Name,CloseDate,StageName
                               FROM Opportunity
                               WHERE Name LIKE :inputName+'%'
                              ]){
                                  system.debug(' :::::::::::::::::::: All Opportunity  :::::::::::::::::::::');
                                  system.debug(' :: Opportunity Name       ::' + Opp.Name);
                                  system.debug(' :: Opportunity CloseDate  ::' + Opp.CloseDate);
                                  system.debug(' :: Opportunity Stage      ::' + Opp.StageName);
                                  system.debug(' :: Opportunity Id         ::' + Opp.Id);
                                  system.debug(' :: inputName              ::' + inputName);
                                  system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
                                  system.debug('                                                             ');
                              }
    }
    
    public static void displayOpportunityTotalAmount(String Stage){
        Decimal totalOpportunityAmount=0;
        for(Opportunity Opp :[SELECT Id,Name,CloseDate,StageName,Amount
                              FROM Opportunity
                              WHERE StageName =: Stage AND
                              Amount != NULL
                             ]){
                                 totalOpportunityAmount += opp.Amount;
                                 system.debug(' :::::::::::::::::::: All Opportunity  :::::::::::::::::::::');
                                 system.debug(' :: Opportunity Name       ::' + Opp.Name);
                                 system.debug(' :: Opportunity CloseDate  ::' + Opp.CloseDate);
                                 system.debug(' :: Opportunity Stage      ::' + Opp.StageName);
                                 system.debug(' :: Opportunity Id         ::' + Opp.Id);
                                 system.debug(' :: Opportunity Amount     ::' + Opp.Amount);
                                 system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
                                 system.debug('                                                             ');
                                 system.debug(' :: Opportunity Amount add in ::' + totalOpportunityAmount);
                                 system.debug('                                                             ');
                             }
        system.debug(' :: Total Opportunity Amount available in ::' + Stage + ' :: ' + totalOpportunityAmount);
    }
    
    public static void displayAccountAndOpportunity(){
        List<Opportunity> opportunityList =[SELECT AccountId,Id,Name,CloseDate,StageName
                                            FROM Opportunity
                                            WHERE (StageName = 'Closed Won' OR 
                                                   StageName = 'Closed Lost') AND 
                                            AccountId != Null
                                           ];
        Map<Id,List<Opportunity>> accountOpportunityMap = new Map<Id,List<Opportunity>>();
        List<Opportunity> displayOpportunityList = new List<Opportunity>();
        for(Opportunity opportunityRecord : opportunityList){
            if(!accountOpportunityMap.containskey(opportunityRecord.AccountId)){
                accountOpportunityMap.put(opportunityRecord.AccountId,new list<Opportunity>());
            }else{
                accountOpportunityMap.get(opportunityRecord.AccountId).add(opportunityRecord);
            }
        }
        for(Id accId : accountOpportunityMap.keyset()){
            displayOpportunityList.addAll(accountOpportunityMap.get(accId));
            system.debug(' :::::::::::::::::::: All Account  :::::::::::::::::::::');
            system.debug(' :: Account Id  ::' + accId);
            system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
            system.debug('                                                             ');
        }
        for(Opportunity displayOpportunity : displayOpportunityList){
            system.debug(' :::::::::::::::::::: All Opportunity  :::::::::::::::::::::');
            system.debug(' :: Opportunity Name       ::' + displayOpportunity.Name);
            system.debug(' :: Account Id        ::' + displayOpportunity.AccountId);
            system.debug(' :: Opportunity CloseDate  ::' + displayOpportunity.CloseDate);
            system.debug(' :: Opportunity Stage      ::' + displayOpportunity.StageName);
            system.debug(' :: Opportunity Id         ::' + displayOpportunity.Id);
            system.debug(' :::::::::: :::::::::: :::::::::  ::::::::: ::::::: :::::::::');
            system.debug('                                                             ');
        }
    }
    
    public static void totalRecordCount(){
        Map<String,Integer> totalRecordCountMap = new Map<String,Integer>();
        for(AggregateResult totalAggre : [select count(Id) coutRecord,Rating
                                          From Account
                                          Where Rating != NULL
                                          Group by Rating
                                         ]){
                                             totalRecordCountMap.put((String)totalAggre.get('Rating'),(Integer)totalAggre.get('coutRecord'));
                                             
                                         }
        for(string total : totalRecordCountMap.keyset()){
            system.debug(total + ' :: ' + totalRecordCountMap.get(total));
        }
    }
    
    public static void allOpportuityName(){
        for(AggregateResult accName : [select count(Id) coutRecord,Name
                                       From Opportunity
                                       where Name like 'A%'
                                       Group by Name
                                       having count(Id) > 1
                                      ]){
                                          system.debug('Opportunity Name = ' + accName.get('Name'));
                                          
                                      }
    }
}