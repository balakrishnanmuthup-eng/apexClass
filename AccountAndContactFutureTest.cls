@isTest
public class AccountAndContactFutureTest {
    
    @isTest
    public Static void doTest(){
        Account acc = new Account();
        acc.Name = 'Test Phone Update';
        acc.Phone = '9078876543';
        
        insert acc;
        Account accRec = [select Id,Name,Phone from Account where Name = 'Test Phone Update'];
        
        Contact con = new Contact();
        con.LastName = accRec.Name;
        con.AccountId = accRec.Id;
        
        insert con;
        
        
        Test.StartTest();
        accRec.Phone = '90788765';
        update accRec;
        Test.StopTest();
        List<Contact> conList =[select LastName,AccountId,Phone from contact where AccountId =: accRec.Id];
        Assert.areEqual(1,conList.size(),'unale to update contact');
    }
}