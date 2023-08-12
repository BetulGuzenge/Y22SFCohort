public class StudentInfo {
    public static void show() {
        list<student__c> l1= [select id,first_name__c,last_name__c,age__c,joining_date__c from student__c];
        system.debug (l1);

        for (student__c eachstudent : l1){
            string name = eachstudent.first_name__c;
            string lastname= eachstudent.last_name__c;
            decimal age = eachstudent.age__c;
            date joiningdate= eachstudent.joining_date__c;

            system.debug ('Student Name: '+ name+ lastname);
            system.debug('Student Age: '+ age +'years old');
            system.debug ('Joining Date: '+ joiningdate);
            system.debug('.............');
        }

    }
}