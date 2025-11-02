public class EmailHelper {
    
    public static boolean doSendEmail(string subject,string body,string toAddress){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new string[] { toAddress };
        message.subject = subject;
        message.htmlbody = body;
        messaging.SingleEmailMessage[] messages = new List<messaging.SingleEmailMessage>{message};
        messaging.SendEmailResult[] result = messaging.SendEmail(messages);
        if(result[0].success){
            return true;
        }else{
            return false;
        }
        
    }

}