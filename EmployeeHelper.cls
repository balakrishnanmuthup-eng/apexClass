public class EmployeeHelper extends Employee {
    
    static Integer employeeCount=0;
    
    public static void findNumberOfEmployeesDepartment(Map<String,Employee> employeeMap,String departments){
        Integer count = 0;
        system.debug(employeeMap.values());
        for(Employee emp : employeeMap.values()){
            if(emp.department == departments){
                system.debug(emp);
                system.debug(emp.department);
                count++;
                system.debug(count); 
            }
        }
        employeeCount = count;
        system.debug(employeeCount);
    }
    
    public static void findLeastSalaryEmployee(Map<String,Employee> employeeMap){
        Integer tempSalary;
        Map<string,Employee> leastSalaryMap = new Map<string,Employee>();
        for(Employee emp : employeeMap.values()){
            if(emp.salary != null){
                if(emp.salary <= tempSalary || tempSalary == null){
                    tempSalary = emp.salary;
                    leastSalaryMap.put(emp.employeeId,emp);
                }else{
                    system.debug('There is salary not available');
                }
                
            }else{
                system.debug('There is salary not available'); 
            }
        }
        for(Employee leastsal : leastSalaryMap.values()){
            if(leastsal.salary <= tempSalary){   
            system.debug(' :::::::::::::::::::: Employee Information  :::::::::::::::::::::');
            system.debug(' :: Employee Id            ::' + leastsal.employeeId);
            system.debug(' :: Employee Name          ::' + leastsal.employeeName);
            system.debug(' :: Employee Deparment     ::' + leastsal.department);
            system.debug(' :: Employee Desigination  ::' + leastsal.designation);
            system.debug(' :: Employee Location      ::' + leastsal.location);
            system.debug(' :: Employee Salary        ::' + leastsal.salary);
            system.debug(' :::::::::: :::::::::: :::::::::  ::::::::::: :::::::::: :::::::::');
            }
        } 
    }
    
    public static void findEmployeeLocation(Map<String,Employee> employeeMap,String locations){
        system.debug(employeeMap.values());
        for(Employee emp : employeeMap.values()){
            if(emp.location == locations){
                system.debug(' :::::::::::::::::::: Employee Information  :::::::::::::::::::::');
                system.debug(' :: Employee Id            ::' + emp.employeeId);
                system.debug(' :: Employee Name          ::' + emp.employeeName);
                system.debug(' :: Employee Deparment     ::' + emp.department);
                system.debug(' :: Employee Desigination  ::' + emp.designation);
                system.debug(' :: Employee Location      ::' + emp.location);
                system.debug(' :: Employee Salary        ::' + emp.salary);
                system.debug(' :::::::::: :::::::::: :::::::::  ::::::::::: :::::::::: :::::::::');
            }
        }
    }
    
    public static void findMaximumSalaryEachDesigination(Map<string, List<Employee>> employeeMap){
        Integer maxSalary;
        List<Employee> employeeList = new  List<Employee>();
        Map<string,Integer> maxSalaryMap = new Map<string,Integer>();
        Map<string,List<Employee>> desiginationEmployeeMap = new  Map<string,List<Employee>>();
        
        for(string  desiginationSingle : employeeMap.keyset()){
            employeeList.addAll(employeeMap.get(desiginationSingle));   
        }
        
        for(Employee emp : employeeList){
            if (!maxSalaryMap.containsKey(emp.designation)) {
                maxSalaryMap.put(emp.designation, emp.salary);
                desiginationEmployeeMap.put(emp.designation, new List<Employee>{emp});
            } else {
                 maxSalary = maxSalaryMap.get(emp.designation);
                if (emp.salary > maxSalary) {
                    maxSalaryMap.put(emp.designation, emp.salary);
                    desiginationEmployeeMap.put(emp.designation, new List<Employee>{emp});
                } else if (emp.salary == maxSalary) {
                    desiginationEmployeeMap.get(emp.designation).add(emp);
                }
            }
        }
        
        List<Employee> displayResult = new List<Employee>();
        for(String eplDesig : desiginationEmployeeMap.keyset()){
            displayResult.addAll(desiginationEmployeeMap.get(eplDesig));
        }
        
        for(Employee empl : displayResult){
                system.debug(' :::::::::::::::::::: Employee Information  :::::::::::::::::::::');
                system.debug(' :: Employee Id            ::' + empl.employeeId);
                system.debug(' :: Employee Name          ::' + empl.employeeName);
                system.debug(' :: Employee Deparment     ::' + empl.department);
                system.debug(' :: Employee Desigination  ::' + empl.designation);
                system.debug(' :: Employee Location      ::' + empl.location);
                system.debug(' :: Employee Salary        ::' + empl.salary);
                system.debug(' :::::::::: :::::::::: :::::::::  ::::::::::: :::::::::: :::::::::');
            }
    }
}