public class Banking {
    public Integer deposited,Withdraw;
    Integer choice,openingBalance = 100000;
    public void depositeOrWidthdraw(Integer choice){
        this.choice = choice;
        if(this.choice == 1){
            openingBalance = openingBalance + deposited;
        }else if(this.choice == 2){
            openingBalance = openingBalance - Withdraw;
        }
    }
    public void displayBalance(){
        system.debug('currentBalance = ' + openingBalance);
    }
}