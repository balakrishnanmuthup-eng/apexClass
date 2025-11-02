@isTest
public class OpportunityBatchTest {
    
    @TestSetup
    public static void doTestSetup(){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList.add(new Opportunity(Name = 'Test 1',StageName = 'Prospecting',CloseDate = Date.Today().addDays(-5)));
        oppList.add(new Opportunity(Name = 'Test 1',StageName = 'Prospecting',CloseDate = Date.Today().addDays(-3)));
        oppList.add(new Opportunity(Name = 'Test 1',StageName = 'Prospecting',CloseDate = Date.Today().addDays(3)));
        oppList.add(new Opportunity(Name = 'Test 1',StageName = 'Prospecting',CloseDate = Date.Today().addDays(-4)));
        oppList.add(new Opportunity(Name = 'Test 1',StageName = 'Prospecting',CloseDate = Date.Today().addDays(-2)));
        
        insert oppList;
    }
    @isTest
    public static void doTest(){
     
        Test.StartTest();
        
        Database.executeBatch(new OpportunityBatch(),20);
        
        Test.StopTest();
        
        List<Opportunity> opp = [select StageName,CloseDate,Name from Opportunity where StageName = 'Closed Lost' AND CloseDate <: system.Today()];
        Assert.areEqual(4,opp.size(),'unable to update Opportunity');
    }
}