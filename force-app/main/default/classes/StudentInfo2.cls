public class StudentInfo2 {
    public static void show() {

        list<student__c> l1=[select id, first_name__c,last_name__c,age__c, gender__c  from student__c order by age__c DESC];
        

        for (student__c eachstudent : l1){
            system.debug('Student Name:' + eachstudent.first_name__c +' '+ eachstudent.last_name__c);
            system.debug('Student Age:' + eachstudent.age__c);
            system.debug('Gender' + eachstudent.gender__c);
            system.debug('............');
        }

    }
}