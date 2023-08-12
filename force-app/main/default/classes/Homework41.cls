public class Homework41 {
    public static void studentlist() {

        List<student__c> l1 = [select first_name__c, last_name__c, ( SELECT Exam_Name__c,Date_of_Exam__c, Marks_Obtained__c, Total_Marks__c FROM Exam_Details__r) from student__c];

        for ( Student__c eachstudent : l1){

            system.debug ('Student Name: '+ eachstudent.first_name__c+ ' '+ eachstudent.last_name__c);
            system.debug('...................');

            list<exam_detail__c> listexam= eachstudent.Exam_Details__r;

            for( exam_detail__c eachexam : listexam){
                system.debug('Exam Name : '+ eachexam.Exam_Name__c);
                system.debug ('Date of Exam: '+ eachexam.Date_of_Exam__c);
                system.debug ('Marks: '+ eachexam.Marks_Obtained__c+'/'+ eachexam.Total_Marks__c);
                system.debug('......................');
            }
            system.debug(':::::::::::::::::::::::::::::::::::::');

           
        }

    }
}