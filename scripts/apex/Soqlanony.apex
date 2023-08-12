list<string> fn = new list<string>{'first_name__c', 'country__c'};
SoqlDemo3.dynamicSoql1(fn);

list<string> fn2 = new list<string>{'first_name__c', 'country__c', 'last_name__c', 'joindate__c'};
SoqlDemo3.dynamicSoql1(fn2);