@isTest
public class ZoneStoreBatchTest {
    
    @TestSetup
    public static void doSetup(){
        List<store__c> storeList = new List<store__c>();
        storeList.add(new store__c(Zone_Code__c = 72499,Store_Number__c = 39133));
        storeList.add(new store__c(Zone_Code__c = 71699,Store_Number__c = 32924));
        
        insert storeList;
        List<Zone__c> zoneList = new List<Zone__c>();
        zoneList.add(new Zone__c(Name = '71699'));
        
        insert zoneList;
    }
    @isTest
    public static void doTest(){
        
        Test.StartTest();
        Database.executebatch(new ZoneStoreBatch(),200);
        Test.StopTest();
        
        List<store__c> storeZoneCode = [select Zone_Code__c from store__c];
        List<Zone__c> ZoneCode = [select Name from Zone__c];
        Assert.areEqual(string.valueof(storeZoneCode[1].Zone_Code__c),ZoneCode[0].Name,'Unable to find zone code');
        
    }
}