decimal salary1 = 100000;
decimal salary2= 50000;
    list <Employee__c> l1 = [select first_name__c , last_name__c ,joindate__c, department__r.short_code__c from employee__c where salary__c > : salary1 or salary__c< : salary2 ];

    system.debug(l1);


