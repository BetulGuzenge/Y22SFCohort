public  class EmployeeTriggerHandler {

   

    public static void UpdateDepartmentPhone(list<employee__c> empTriggerNew , map <id,employee__c> empTriggerNewMap, List<Employee__c> empTriggerOld, Map <id,employee__c> empTriggerOldMap) {

        //get department ids 

       //   set <id> deptIds = new  set<id>();
      map <id,string> depIdsPhone = new map <id,string>();
      for(Employee__c newEmp : empTriggerNew){
        if(newEmp.Department__c != null){
            // deptIds.add(newEmp.Department__c);
            //adding dept id and phone which we want to update in that department 
            depIdsPhone.put (newEmp.Department__c,newEmp.department_phone__c);
        }
      }

      List <Department__c> allDepts = [ select id , department_phone__c from Department__c where id in: depIdsPhone.keySet()];

      for (Department__c eachDep: allDepts){
        eachDep.department_phone__c = depIdsPhone.get(eachDep.Id);
      }

      
      update allDepts; // will call department trigger
      
     
        
      }
      // Homework12 try later again 
    public static void ValidationDeleteEmployee (List<Employee__c> empTriggerOld, map <id,Employee__c> empTriggerOldMap){
        
        List<Employee__c> allEmpployees= [SELECT Id, Department__c FROM Employee__c where id IN  :empTriggerOld];
        
        for (Employee__c eachemp :allEmpployees ){
          if (eachemp.Department__c != null){
            eachemp.addError('This record can not be deleted . It is related to a department');
          }
        }

      }
    }

