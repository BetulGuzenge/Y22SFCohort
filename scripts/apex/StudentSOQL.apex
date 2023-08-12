list<string> listSO = new list<string>{'first_Name__c','last_Name__c' 'Student__c'};
SoqlDemo3.dynamicSoql2(fn3, 'Employee__c');

system.debug('----');

list<string> fn4 = new list<string>{'name', 'phone', 'website'};
SoqlDemo3.dynamicSoql2(fn4, 'account');