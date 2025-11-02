public class CustomerProjectHelper {
    
    public static void updateOpportunityRelatedCustomerProject(List<Customer_Project__c> custproList){
        set<Id> oppIds = new set<Id>();
        List<Opportunity> opportunityList = new List<Opportunity>();
        for(Customer_Project__c customerProjectRecord : custproList){
            if(customerProjectRecord.Status__c == 'Active' && customerProjectRecord.OpportunityId__c != Null){
                oppIds.add(customerProjectRecord.OpportunityId__c);
            }
        }
        if(oppIds.size() > 0){
            for(Opportunity opportunityRecord : [select Active_Customer_Project__c 
                                                 From Opportunity
                                                 Where Id IN: oppIds
                                                ]){
                                                    opportunityRecord.Active_Customer_Project__c = true;
                                                    opportunityList.add(opportunityRecord);
                                                }
        }
        if(!opportunityList.isEmpty())
            update opportunityList;
    }
}