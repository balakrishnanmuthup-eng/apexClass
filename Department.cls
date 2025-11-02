public class Department{
    
    public static void insertDepartment(String name){
        List<Department__c> departmentCreationList = new List<Department__c>();
        boolean isDuplicate;
        for(Department__c deprtment : [select Depart_Name__c
                                       From Department__c
                                      ]){
                                          system.debug(deprtment.Depart_Name__c.contains(name));
                                          if(deprtment.Depart_Name__c.contains(name)){
                                              isDuplicate = false;
                                             system.debug('This Department name is already existing');
                                          }else{
                                             isDuplicate = true;
                                              system.debug('in else');
                                          }
                                      }
        if(isDuplicate){
            Department__c departmentCreation = new Department__c();
            departmentCreation.Depart_Name__c=name;
            insert departmentCreation;
        }
    }
    
    public static void deleteRecord(String name){
        boolean isDuplicate;
        List<Department__c> departmentDeletionList = new List<Department__c>();
        for(Department__c deprtment : [select Depart_Name__c
                                       From Department__c
                                      ]){
                                          if(deprtment.Depart_Name__c == name){
                                              departmentDeletionList.add(deprtment);
                                          }else{
                                              isDuplicate = true;
                                          }
                                          
                                      }
        if(isDuplicate){
            system.debug('There no Records available');
        }
        
        if(!departmentDeletionList.isEmpty()){
            delete departmentDeletionList;
            system.debug('Record is deleted');
        }
    }
    
    public static void departmentInsertUpdateDelete(){
        List<Department__c> departmentInsertList = new List<Department__c>();
        List<Department__c> departmentUpdateList = new List<Department__c>();
        List<Department__c> departmentDetletionList = new List<Department__c>();
        
        
            Department__c departmentInsert = new Department__c();
            departmentInsert.Depart_Name__c = 'Department Insert';
            departmentInsert.Location__c = 'coimbatore';
            departmentInsertList.add(departmentInsert);
        
        if(!departmentInsertList.isEmpty()){
            insert departmentInsertList;
            system.debug('Inserted Records :: ' + departmentInsertList.size());
        }
        for(Department__c deprtmentupdate : [select Depart_Name__c
                                             From Department__c
                                             where Depart_Name__c Like 'Department%'
                                            ]){
                                                if(deprtmentupdate.Id != null){
                                                    deprtmentupdate.Phone_Number__c = '9898989898';
                                                    departmentUpdateList.add(deprtmentupdate);
                                                    
                                                }else{
                                                    system.debug('there is no Record to update');
                                                }
                                                
                                            }

        if(!departmentUpdateList.isEmpty()){
            update departmentUpdateList;
            system.debug('Updated Records :: ' + departmentUpdateList.size());
        }
        for(Department__c deprtmentdelete : [select Depart_Name__c,Location__c
                                             From Department__c
                                             where Location__c = 'chennai'
                                            ]){
                                                if(deprtmentdelete.Id != null && deprtmentdelete.Location__c == 'chennai'){
                                                    departmentDetletionList.add(deprtmentdelete);
                                                }else{
                                                    system.debug('there is no Record to delete');
                                                }
                                            }
        system.debug('Deleted Records :: ' + departmentDetletionList.size());
        if(!departmentDetletionList.isEmpty()){
            delete departmentDetletionList;  
        }
    }
 
    public static void numberOfEmploees(){
        Map<Id,Department__c> departmentMap = new Map<Id,Department__c>();
        Map<Id,Integer> countEmployeeMap = new Map<Id,Integer>();
        for(Department__c departmentRecord : [Select Depart_Name__c
                                              from Department__c
                                              where Depart_Name__c != null
                                             ]){
                                                 departmentMap.put(departmentRecord.Id,departmentRecord);
                                             }
        for(AggregateResult employeeCount:[select count(Id) empCount,Department__c
                                           from Employees__c 
                                           where Department__c IN: departmentMap.keyset()
                                           group by Department__c
                                          ]){
                                              system.debug('Department :: ' + employeeCount.get('Department__c') + 
                                                           ' :: Employeecount :: ' + employeeCount.get('empCount'));
                                              Id deptId = (Id)employeeCount.get('Department__c');
                                              Integer count = (Integer)employeeCount.get('empCount');
                                              countEmployeeMap.put(deptId,count);
                                          }
        Integer currentcount;
        Id LeastDepartment;
        for(Id departmentId : countEmployeeMap.keyset()){
            Integer count = countEmployeeMap.get(departmentId);
            if(count < currentcount || currentcount == null){
                currentcount = count;
                LeastDepartment = departmentId;
            }
        }
        system.debug('The least emploee count department ::' + LeastDepartment);
        system.debug('The least emploee count  ::' + currentcount);
    }
    public static void undeleteDepartment(){
        List<Department__c> redoDeleteList = new List<Department__c>();
        for(Department__c departRecord : [select Id,Name 
                                          from Department__c
                                          where Name = 'DEID-001'
                                          ALL ROWS
                                         ]){
                                             system.debug('Deapartment Record '+departRecord);
                                             redoDeleteList.add(departRecord);
                                             
                                         }
        if(!redoDeleteList.isEmpty()){
            undelete redoDeleteList;
        }
    }
}