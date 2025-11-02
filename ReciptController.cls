public class ReciptController {
    
    @AuraEnabled
    public static void insertRecipt(Integer amount,string modeOfPay,Date amountPaidDate,string contactId){

        Receipt__c receipt = new Receipt__c();
        receipt.Amount__c = amount;
        receipt.Mode_of_Pay__c = modeOfPay;
        receipt.Amount_Paid_Date__c = amountPaidDate;
        receipt.ContactId__c = contactId;
        insert receipt;

    }
}