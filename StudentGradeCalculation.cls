public class StudentGradeCalculation {
    Integer M1,M2,M3,total;
    Decimal average;
    String result,grade;
    final Integer PASS_MARK = 45;
    public void calculateAverage(Integer M1,Integer M2,Integer M3){
        total = M1 + M2 + M3;
        average=total/3;
        calculateResult(M1,M2,M3);
    }
    public void calculateResult(Integer M1,Integer M2,Integer M3){
        if(M1 >= PASS_MARK && M2 >= PASS_MARK && M3 >= PASS_MARK){
            result = 'Pass';  
        }else{
            result = 'Fail';
        }
        calculateGrade();
    }
    public void calculateGrade(){
        if(result=='pass'){
            if(average>90) {
                grade='S'; 
            }else if(average>80){ 
                grade='A'; 
            }else if(average>60){ 
                grade='B';
            }else if(average>50){ 
                grade='C';
            }
        }else{
            grade='No Grade';
        }
        displayGrade();
    }
    public void displayGrade(){
        system.debug('Student Grade is = ' + grade);
    }
}