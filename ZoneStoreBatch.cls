public class ZoneStoreBatch implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Store_Number__c,ZoneId__c,Zone_Code__c
                                        FROM Store__c
                                        WHERE Zone_Code__c != Null]);
    }
    
    public void execute(Database.BatchableContext bc,List<Store__c> storeList){
        set<String> zoneCode = new set<String>();
        List<Zone__c> insertZoneList = new List<Zone__c>();
        List<Store__c> updateStoreList = new List<Store__c>();
        Map<string,Zone__c> zoneMap = new Map<string,Zone__c>();
         for(Store__c storeRecord : storeList){
             zoneCode.add(string.valueof(storeRecord.Zone_Code__c)); 
         }
        for(Zone__c zoneRecord : [SELECT Name,Id
                                   FROM Zone__c
                                   WHERE Name IN: zoneCode ]){
            zoneMap.put(zoneRecord.Name,zoneRecord);
        }
        for(Store__c storeRecord : storeList){
                                      if(!zoneMap.containskey(string.valueof(storeRecord.Zone_Code__c))){
                                          Zone__c newZone = new Zone__c();
                                          newZone.Name = string.valueof(storeRecord.Zone_Code__c);
                                          insertZoneList.add(newZone);
                                      }
                                  } 
        if(!insertZoneList.isEmpty()){
            List<Database.SaveResult> saveresult = Database.insert(insertZoneList,false);
            for(Database.SaveResult sr : saveresult){
                if(sr.isSuccess()){
                    system.debug('records are successfully updated :: '+sr.getId());
                } else {
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('Error :: ' + err.getMessage());
                    }
                } 
            }
        }
        
        for(Zone__c insertedZoneCode :insertZoneList){
            zoneMap.put(insertedZoneCode.Name,insertedZoneCode);
        }
        
        for(Store__c storeupdateRecord : storeList){
                                      if(zoneMap.containskey(string.valueof(storeupdateRecord.Zone_Code__c))){
                                          storeupdateRecord.ZoneId__c = zoneMap.get(string.valueof(storeupdateRecord.Zone_Code__c)).Id;
                                          updateStoreList.add(storeupdateRecord);
                                      }
                                  } 
        
        if(!updateStoreList.isEmpty()){
            List<Database.SaveResult> saveresult = Database.update(updateStoreList,false);
            for(Database.SaveResult sr : saveresult){
                if(sr.isSuccess()){
                    system.debug('records are successfully updated :: '+sr.getId());
                } else {
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('Error :: ' + err.getMessage());
                    }
                } 
            }
        }
    }
    
    public void finish(Database.BatchableContext bc){
        AsyncApexJob lst =[select Id,Status,NumberofErrors,TotalJobItems
                           from AsyncApexJob
                           where Id =: bc.getJobId()
                          ];
        string toAddress=label.EmailLabel;
        string subject='leadupdate batch apex';
        string body='Hi Lead batch job </br>';
        body+='</br> Status ::'+lst.Status;
        body+='</br> Number of Error ::'+lst.NumberofErrors;
        body+='</br> Total Jobs ::'+lst.TotalJobItems;
        EmailHelper.doSendEmail( subject, body, toAddress);

    }
}