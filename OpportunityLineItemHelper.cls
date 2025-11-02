public class OpportunityLineItemHelper {
    
    public static void updateOpportunityProductCode(List<OpportunityLineItem> opplineitemList){
        List<Opportunity> OpportunityList = new List<Opportunity>();
        List<String> productCodeList = new List<String>();
        set<Id> oppIds = new set<Id>();
        for(OpportunityLineItem opportunityLineItemRecord : opplineitemList){
            if(opportunityLineItemRecord.OpportunityId != null ){
                oppIds.add(opportunityLineItemRecord.OpportunityId);
            }  
        }
        if(oppIds.size() > 0){
            for(OpportunityLineItem productcode : [select OpportunityId,ProductCode
                                                   from OpportunityLineItem
                                                   where OpportunityId IN: oppIds
                                                  ]){
                                                      productCodeList.add(productcode.ProductCode);
                                                  }
            for(Opportunity opportunityRecord : [select Opportunity_LineItem_ProductCode__c 
                                                 from Opportunity
                                                 Where Id IN: oppIds
                                                ]){
                                                        opportunityRecord.Opportunity_LineItem_ProductCode__c = (productCodeList != null && !productCodeList.isEmpty()) ? string.join(productCodeList,',') : Null;
                                                        OpportunityList.add(opportunityRecord); 
                                                }
        }
        if(!OpportunityList.isEmpty())
            update OpportunityList; 
    }
}