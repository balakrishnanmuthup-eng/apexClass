public class NumberOperation {
    Integer maxNumber=0;
    List<Integer> numberList = new List<Integer>{31,80,12,11,-31,-80,-12,-11};  // common numbers list
        public void maxNumberCalculation(){
            system.debug(' -- What is inside the actually = ' + numberList);
            for(Integer singleNumber : numberList){
                if(singleNumber > maxNumber){
                    maxNumber = singleNumber;
                }
            }
            system.debug(' -- The Maximum Number the List = ' + maxNumber);
        }
    public void calculateOddAndEven(){
        List<Integer> oddNumberList = new List<Integer> ();
        List<Integer> evenNumberList = new List<Integer> ();
        for(Integer singleNumber : numberList){
            if(singleNumber > 0){
                if(math.mod(singleNumber,2) == 0 ){
                    evenNumberList.add(singleNumber);
                }else{
                    oddNumberList.add(singleNumber);
                }
            }
        }
        system.debug(' -- The Even Numbers in the List = ' + evenNumberList);
        system.debug(' -- The Odd Numbers in the List = ' + oddNumberList);
    }
    public void negativeNumbers(){
        List<Integer> negativeNumberList = new List<Integer>();
        Integer countOfNegativeNumber;
        for(Integer singleNumber : numberList){
            if(singleNumber < 0){
                negativeNumberList.add(singleNumber);
            }
        }
        countOfNegativeNumber = negativeNumberList.size();
        system.debug(' -- The negative Numbers in the List = ' + negativeNumberList);
        system.debug(' -- The Count negative Numbers  = ' + countOfNegativeNumber);
    }
    public void reverseNumber(){
        List<Integer> reverseNumberList = new List<Integer>();
        Integer countOfList = numberList.size() - 1;
        system.debug(' -- TcountOfList  = ' + countOfList + ' -- numberList  = ' + numberList.size());
        for(Integer Index = countOfList; Index >= 0; Index--){
            reverseNumberList.add(numberList[Index]);
            system.debug(' -- TcountOfList  = ' + numberList[Index] );
        }
        system.debug(' -- The Reverse Numbers  = ' + reverseNumberList);
    }
}