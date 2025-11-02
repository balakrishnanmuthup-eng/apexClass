public class ContactRelationshipHelper {
    public static void updateNameFromOwner(List<Contact_Relationship__c> conRelationshipList,Map<Id,Contact_Relationship__c>conRelationshipOldMap){
        Set<Id> userIds = new Set<Id>();
        List<Contact_Relationship__c> contactrelationshipList = new List<Contact_Relationship__c>();
        for(Contact_Relationship__c contactRelationshipRecord : conRelationshipList){
            if(contactRelationshipRecord.OwnerId != conRelationshipOldMap.get(contactRelationshipRecord.Id).OwnerId){
                userIds.add(contactRelationshipRecord.OwnerId);
            }
        }
        if(userIds.size() > 0){
            Map<Id,user> userMap = new Map<Id,user>([select Id,Name
                                                     from user
                                                     where Id IN:userIds]);
            
            for(Contact_Relationship__c conRelationRecord : conRelationshipList){
                if(userMap.containskey(conRelationRecord.OwnerId)){
                    conRelationRecord.Name = userMap.get(conRelationRecord.OwnerId).Name;
                    contactrelationshipList.add(conRelationRecord);
                }
            }
        }
    } 
    
}