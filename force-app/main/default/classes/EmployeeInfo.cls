public class EmployeeInfo {
    public static void show () {

        list <Employee__c> listEmp = [SELECT first_name__c, last_name__c, joindate__c from Employee__c order by joindate__c desc];

        for (employee__c eachemp : listEmp) {
            system.debug('Employee Name =' + eachemp.first_name__c+ ' '+ eachemp.last_name__c);
            system.debug('Joining date :'+ eachemp.joindate__c);
            system.debug ('....');
            
        }

    }

    public static void show2(){
        employee__c emp= [select id,first_name__c, last_name__c,createddate from employee__c order by createddate desc limit 1 ];
        // if we call only one record instead of list we can create a variable (list also works but inside of list there will be only one item)
        system.debug (emp.id);
        system.debug (emp.first_name__c);

    }

    public static void show3(){
        list <student__c> l1 = [select first_name__c, last_name__c ,age__c , gender__c FROM student__c limit 10];
        for (student__c eachstudent : l1) {
            system.debug(l1);
            
        }
      
    }
}