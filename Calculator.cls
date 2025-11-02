public class Calculator {
    public Integer input1,input2,result;
    public String Operation;
    public void calculation(){
        if(Operation == '+'){
            result = input1 + input2;
            System.debug(' Addition = ' + result);
        }else if(Operation == '-'){
            result = input1 - input2;
            System.debug(' Subraction = ' + result);
        }else if(Operation == '*'){
            result = input1 * input2;
            System.debug(' Multiplication = ' + result);
        }else if(input2 != 0 && Operation == '/'){         // cannot divided by 0
            result = input1 / input2;
            System.debug(' Division = ' + result);
        }else{
            result = 0;
            System.debug('cannot divided by '+result);
        }
    }
}