public class SearchObject {
    public static void searchRecord(string objects,List<string> fieldsList){
        string extract = string.join(fieldsList,',');
        string query = 'select ' + extract + ' From ' + objects;
        List<SObject> lists = Database.Query(query);
        for(SObject lsts: Lists){
            System.debug(lsts);
        }
    }
    public static void searchRecord(string objects,List<string> fieldsList,String fieldName,String Operator,String Value){
        string extract = string.join(fieldsList,',');
        string query = 'select ' + extract + ' From ' + objects + ' Where ' + fieldName + ' ' + Operator + ' ' + ' \'' + Value + '\'';
        List<SObject> lists = Database.Query(query);
        for(SObject lsts: Lists){
            System.debug(lsts);
        }
    }
    
}