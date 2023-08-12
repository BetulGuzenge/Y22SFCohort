
for (student__c eachstu : [select first_name__c, last_name__c, gender__c from student__c where Joining_Date__c = Today ]) {

    system.debug('Student Name:' + eachstu.first_name__c+' '+ eachstu.last_name__c);
    system.debug('Gender: ' + eachstu.gender__c);
    system.debug('........');
}