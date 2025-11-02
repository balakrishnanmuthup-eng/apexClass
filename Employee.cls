public virtual class Employee {
    
    protected String department,location,employeeId,employeeName,designation;
    protected Integer salary;
    
    public Employee(){}
    
    public Employee(String department,String employeeId,String employeeName,String designation,String location,Integer salary){
        this.department = department;
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.designation = designation;
        this.location = location;
        this.salary = salary;
    }
}