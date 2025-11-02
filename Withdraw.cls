public class Withdraw extends Bank{
    public void doWithdraw(Integer amount){
        if(amount > 0 && amount <= openingBalance){
            openingBalance = openingBalance - amount;
            system.debug('Available Balance = ' + openingBalance);
        }else{
            system.debug('Insufficient Balance');
        }
    }
}