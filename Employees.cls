public class Employees {    //Associate Executive Senior Head Manager
    
    public static void position(){
        List<Employees__c> employeeInsertList = new List<Employees__c>();
        List<Employees__c> employeeUpdateList = new List<Employees__c>();
        
        Employees__c employee = new Employees__c();
        employee.Employee_Name__c ='test insert';
        employee.Employee_Email__c = 'test@gmail.com';
        employeeInsertList.add(employee);
        if(!employeeInsertList.isEmpty()){
            insert employeeInsertList;
        }
        for(Employees__c emp :[select Position__c,Employee_Name__c
                               from Employees__c
                              ]){
                                  if(emp.Position__c == null){
                                      emp.Position__c = 'Other';
                                      employeeUpdateList.add(emp);
                                  } 
                              }
        if(!employeeUpdateList.isEmpty()){
            update employeeUpdateList;
        }
    }
    
    public static void positionOtherthanHead(){
        List<Employees__c> employeeInsertList = new List<Employees__c>();
        List<Employees__c> employeeUpdateList = new List<Employees__c>();
        
        Employees__c employee = new Employees__c();
        employee.Employee_Name__c ='Position Head insert';
        employee.Employee_Email__c = 'test@gmail.com';
        employee.Position__c = 'Executive';
        employee.Salary__c = 90000;
        employeeInsertList.add(employee);
        if(employee.Salary__c > 80000 && employee.Position__c != 'Head Manager'){
            system.debug('If Position otherthan Head Salary Should be below 80000');
        }else{
            if(!employeeInsertList.isEmpty()){
            insert employeeInsertList;
            }
        }
        
        /*for(Employees__c emp :[select Position__c,Employee_Name__c,Salary__c
                               from Employees__c
                               where Position__c != 'Head Manager'
                               order by Id  desc 
                               Limit 1
                              ]){
                                  if(emp.Salary__c > 80000 && emp.Position__c != 'Head Manager'){
                                     system.debug('If Position otherthan Head Salary Should be below 80000 :: ' + emp.Employee_Name__c); 
                                  }else{
                                      system.debug('Employee created succesfully :: ' + emp.Employee_Name__c); 
                                  }
                              }*/
        
    }
    
    public static void maximumSalary(String Position){
        List<AggregateResult> findEmployeeMaxSalaryList = new List<AggregateResult>();
        for(AggregateResult employee : [select MAX(Salary__c) maxsalary,Position__c
                                        from Employees__c
                                        where Position__c =: Position
                                        Group By Position__c
                                       ]){ 
                                           findEmployeeMaxSalaryList.add(employee); 
                                           system.debug(':::::::::::::::::::::::: Employyees Detail  :::::::::::::::::::::::::::::::');
                                           system.debug('Employee Salary ' + employee.get('maxsalary'));
                                           system.debug('Employee Position ' + employee.get('Position__c'));
                                           system.debug('Employee Position ' + employee.get('Position__c'));
                                           system.debug(':::::::::::::::::::::::: ::::::::::::::  :::::::::::::::::::::::::::::::::::');
                                       }
    }
          
    public static void displayAvailablePosition(){
        List<AggregateResult> availablePosition = [select Position__c,Min(Salary__c) minSalary,Max(Salary__c) maxSalary
                                               from Employees__c
                                                Group by Position__c 
                                               ];
        for(AggregateResult record : availablePosition){
                system.debug('postion :: '+ record.get('Position__c') +' :: '+ 
                             'Minimum Salary :: ' + record.get('minSalary') +' :: ' + 
                             'Maximum Salary :: ' + record.get('maxSalary'));  
        }
    }
}