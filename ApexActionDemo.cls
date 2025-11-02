public class ApexActionDemo {
    
    @InvocableMethod(label='Get Accounts From Apex' Description='Get Accounts From Apex')
    public static List<List<Account>> getValuesFromCheckBoxGroup(List<InputData> Params){
        
        string rating = params[0].rating;
        List<String> ratingcollection = rating.split(';');
        string industry = params[0].industry;
        List<List<Account>> accountCollection = new List<List<Account>>();
        accountCollection.add([select Name,Rating,Industry From Account Where Rating in: RatingCollection and industry =: industry]);
        
        return accountCollection;
    }
    public class InputData
    {
        @InvocableVariable(label='Rating' Description='Account Rating')
        public string rating;
        
        @InvocableVariable(label='Industry' Description='Account Industry')
        public string Industry;
        
    }
    /*@InvocableMethod(label='Split Checkbox Item' Description='Split the Selected Checkbox Values')
    public static List<List<String>> getValuesFromCheckBoxGroup(List<String> selectedValues){
        
        List<String> SplittedValues = selectedValues[0].split(';');
        List<List<String>> returnList = new List<List<String>>();
        returnList.add(splittedValues);
        return returnList;
    }*/

}