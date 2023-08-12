public class DepartmentTriggerHandler {

    public static boolean allEmployeeUpdated = false ;// this is called as boolean flag

    public static void updateEmployeePhone(list <department__c> depTriggerNew , map <id,department__c> depTriggerNewMap, List<Department__c> depTriggerOld , Map<Id,Department__c> depTriggerOldMap ) {

        //get all employees of all the updated departments

        list <employee__c > allEmps = [select id, Department__c , department_phone__c from Employee__c where Department__c in: depTriggerNewMap.keyset()];
        system.debug('allEmps : '+ allEmps);
        
        for( Employee__c eachEmp : allEmps ){
            //get employee's department's department phone field here 

            department__c  newdept = depTriggerNewMap.get (eachEmp.Department__c);
            eachEmp.department_phone__c = newdept.department_phone__c;
        }
        allEmployeeUpdated = true;
        update allEmps;

    }
}