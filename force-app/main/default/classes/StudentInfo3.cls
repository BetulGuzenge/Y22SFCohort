public class StudentInfo3 {
    public static void show() {

        list<student__c> l1= [select id,first_name__c,last_name__c,joining_date__c from student__c limit 5];
       
        for (student__c eachstudent : l1){
            
            system.debug ('Student Name: '+ eachstudent.first_name__c + ' '+ eachstudent.last_name__c);
            system.debug ('Joining Date: '+ eachstudent.joining_date__c);
            system.debug('.............');
        }
    }
}