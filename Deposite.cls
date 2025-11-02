public class Deposite extends Bank{
    public void doDeposite(Integer amount){
        if(amount > 0){
            openingBalance = openingBalance + amount;
            system.debug('Amount  '+ amount +' Succesfully Deposited');
            system.debug('Balance Amount = '+ openingBalance);
        }
    }
    
}