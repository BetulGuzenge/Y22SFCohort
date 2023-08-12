decimal maxSalary = 50000;
List<Employee__c> listEmp = [select first_name__c, last_name__c, salary__c from employee__c where salary__c < :maxSalary];
system.debug(listEmp);