public class DMLHomework16 {
    public static void HMW16() {

        list<student__c> l1 =[ select Id, first_name__c,last_name__c from student__c where first_name__c='Angelina' AND last_name__c='Jolie'];
        system.debug(l1);

        delete l1;

       
    }

    public static void HMW18(){
        // Classroom is required field . I have to use classroom field even though it is not asked in the question. 
        student__c student= new student__c (First_name__c= 'Gal', Last_name__c = 'Gadot', classroom__c ='a02Do000001i7gaIAA');
        insert student;
        
        delete student;

        undelete student;

        system.debug (student);
                
        

    }
}