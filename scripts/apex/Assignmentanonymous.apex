

for (student__c eachstudent : [select first_name__c , last_name__c, age__c from student__c where standart__c = 10]){
    system.debug('student Info: '+ eachstudent.first_name__c +' '+ eachstudent.last_name__c + ' '+ eachstudent.age);
}