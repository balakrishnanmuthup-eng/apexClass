@isTest
public class OpportunityHelperTest {
    
    @testsetup
    public static void setData(){
        User testUser = [SELECT Id FROM User WHERE LastName = 'Ajith' AND Profile.Name = 'Sales' AND IsActive = TRUE LIMIT 1];
        List<Opportunity> opportunityList = new List<Opportunity>();
            for(Integer count=1 ;count <= 250; count++){
                Opportunity opp = new Opportunity();
                opp.Name = 'Test opportunity task'+count;
                opp.CloseDate = System.today().addDays(30);
                opp.StageName = 'Prospecting';
                opp.Sales_Rep__c = testUser.Id;
                opportunityList.add(opp);
            }
        insert opportunityList;
    }
    
    @istest
    public static void updateOpportunity(){
        List<opportunity> oppList =[select Id,StageName,Name
                                    From Opportunity
                                   ];
        for(Opportunity oppRecord : oppList){
            oppRecord.StageName = 'Closed Won';
        }
        update oppList;
        
        
        Map<Id,Opportunity> oppoMap = new Map<Id,Opportunity>([select Sales_Rep__c,Name
                                      from Opportunity
                                      Where Name Like 'Test opportunity task%'
                                     ]);
        List<Task> taskRecordList = [select OwnerId,Subject
                               from Task
                               Where WhatId IN: oppoMap.keyset()
                              ];
        system.debug('Actual size :: '+taskRecordList.size());
        system.debug('Expected size :: '+oppList.size());
        system.assertequals(oppList.size(),taskRecordList.size(),'Both size are not match ');
    }

}