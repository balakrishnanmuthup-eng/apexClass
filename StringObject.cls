public class StringObject {
    static Integer input=20;
    
    public static void cancatData(List<Object> dataObject){
        if(dataObject[0] instanceof Integer && dataObject[1] instanceof Integer){
            system.debug((Integer)dataObject[0] + (Integer)dataObject[1]);
        }else if(dataObject[0] instanceof string && dataObject[1] instanceof string){
                system.debug((string)dataObject[0] + (string)dataObject[1]);
        }
    }
    
    public static void countOfString(String input){
        Integer count = 1;
         List<string> inputStringList = input.split('');
        for(string ins : inputStringList){
            if(ins == ' '){
               system.debug(ins);
                count++;
            }
        }
        system.debug('The count of spaces : '+ count);
    }
    
    public static void countOfwords(String input){
        Integer countofword = 0;
        string word = 'Apex LWC Apex Apex apex';
        List<string> inputWordList = word.split(' ');
        for(string ins : inputWordList){
            if(ins.contains(input)){
                system.debug(ins);
                countofword++;
            }
        }
        system.debug('The count of spaces : '+ countofword);
    }
    public static void startOfwords(String input){
        Integer countofword = 0;
        string word = 'ApexString LWC ApexInteger Apex apex';
        List<string> inputWordList = word.split(' ');
        for(string ins : inputWordList){
            if(ins.startsWith(input)){
                system.debug(ins);
                countofword++;
            }
           
        }
        system.debug('The count of spaces : '+ countofword);
    }
    
    public static void dateTimeFunction(){
        DateTime firstDate = system.today();
        DateTime secondDate = firstDate.addDays(2).addHours(3).addMinutes(30);
        long seconds = (secondDate.getTime()-firstDate.getTime())/1000;
      
        long Minutes = seconds /60;
        long atualminutes = math.mod(Minutes,60);
        system.debug(atualminutes);
        
        long Hours = Minutes /60;
        long atualHours = math.mod(Hours,24);
        system.debug(atualHours);
        
        long Day = Hours /24;
        long atualDay = math.mod(Day,24);
        system.debug(atualDay);
        system.debug(atualDay + ':' + atualHours + ':' + atualminutes + ':' + seconds);
    }
    
     public static void dateFunctionWeekDay(){
         Date lasteWeekMonday;
         Date currentDate = date.today();
         Date currentWeekday = currentDate.toStartofWeek(); 
         date test = date.newInstance(2025,6,29).toStartofWeek();
         lasteWeekMonday = currentWeekday.addDays(-6);
         system.debug(lasteWeekMonday);
        /* for(Integer i=7;i>currentWeekday;--i){
             
                 lasteWeekMonday = currentWeekday.addDays(-count);
                 
                 system.debug(lasteWeekMonday);
             
             count++;
             system.debug(count);
             
         }/*
          /*Date myDate = Date.today();
            Date weekStart = myDate.toStartofWeek();
         system.debug(date.newInstance(2025 ,6 ,29).addDays(-13));
         system.debug(weekStart);
            if(myDate ==  weekStart){
                System.debug('weekStart >>'+ weekStart.addDays(-13));
            }
            else{
                System.debug('weekStart >>'+ weekStart.addDays(-6));
            }*/ 
     }
}