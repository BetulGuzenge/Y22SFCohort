integer age1 =8;
integer age2 =13;

list<student__c> liststu = [select first_name__c, last_name__c, age__c, classroom__r.standart__c from Student__c where age__c>:age1 and age__c<:age2];
system.debug(liststu);