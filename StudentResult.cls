public class StudentResult {
    String studentName,gradeOfTheStudent,result;
    Integer physics,chemistry,maths,total,average;
    final integer PASSMARK = 35;
    public void calculateGrade(Integer physics,Integer chemistry,Integer maths,String studentName){
        this.physics = physics;
        this.chemistry =chemistry;
        this.maths = maths;
        this.studentName = studentName;
        total = physics + chemistry + Maths;
        average = Total / 3;
        if(this.physics >= PASSMARK && this.chemistry >= PASSMARK && this.Maths >= PASSMARK){
            result = 'Pass';
        }else{
            result = 'Fail';
        }
        if(result == 'Pass'){
            if(average > 90){
                gradeOfTheStudent = 'S Grade';
            }else if(average > 80){
                gradeOfTheStudent = 'A Grade';
            }else if(average > 70){
                gradeOfTheStudent = 'B Grade';
            }else if(average > 50){
                gradeOfTheStudent = 'C Grade';
            }
            
        }else{
            gradeOfTheStudent = ' No Grade ';
        }
        
    }
    public void DisplayStudentDetail(){
        system.debug('StudentName = ' + this.studentName);
        system.debug('average = ' + average);
        system.debug('gradeOfTheStudent = ' + gradeOfTheStudent);
        system.debug('result = ' + result);
    }
    
}