public class BankControllerRefactored {
    Decimal openingBalance=5000;
    Integer userOption; //1 - deposit //2-withdraw //3-check current balance
    final Integer OPTION_WITHDRAW=1;
    final Integer OPTION_DEPOSIT=2;
    final Integer MINIMUM_BALANCE = Integer.valueOf(System.Label.Minimum_Balance) ;
    public void processUserRequest(integer amount, integer option){
        userOption=option;
        if(userOption==OPTION_DEPOSIT){    //deposit
            doDeposit (amount);
        }else if(userOption==OPTION_WITHDRAW){   //withdraw
            if(checkSufficientFund(amount)){
                checkMinimumBlance(amount);
            }else{
                system.debug('InSufficient Fund');
            }
        }
    }
    public void doDeposit (integer amount){
        openingBalance = openingBalance + amount;
        showCurrentBalance();
    }
    public void doWithdraw(integer amount){
        openingBalance = openingBalance - amount;
        showCurrentBalance();
    }
    public Boolean checkSufficientFund (integer amount){
        if(amount>openingBalance){
            return false;
        }else{
            return true;
        }
    }
    public void checkMinimumBlance(integer amount){ 
        Decimal currentBalance = openingBalance-amount;
        if(MINIMUM_BALANCE <= currentBalance){
            doWithdraw(amount);
        }else{
            system.debug('The minimum balance should be 1000');
        }
    }
    public void showCurrentBalance(){
        system.debug('current Balance = ' + openingBalance);
    }
}