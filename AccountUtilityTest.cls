@isTest
public class AccountUtilityTest {
    
    @isTest
    public static void loadData(){
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        Account acc = new Account();
        acc.Name = 'Test accountutility';
        
        insert acc;
        
        for(Integer i=0;i<5;i++){
            Contact con = new Contact();
            con.LastName = 'Test Contact with account '+i;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        
        for(Integer i=0;i<3;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opportunity with account '+i;
            opp.CloseDate = system.today();
            opp.StageName = 'Closed Won';
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        
        Test.StartTest();
        insert conList;
        insert oppList;
        Test.StopTest();
        
        Integer childCount = AccountUtility.getAccountsRelatedChild();
        Assert.areEqual(8,childCount,'Uable find the calculation');
    }
    
}