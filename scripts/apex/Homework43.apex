string gender='Female';

list<student__c> liststu = [select first_name__c, last_name__c, age__c, joining_date__c from Student__c where gender__c =:gender];
system.debug(liststu);