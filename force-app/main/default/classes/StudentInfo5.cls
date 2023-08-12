public class StudentInfo5 {
    public static void studentjoiningdate() {
        list<student__c> liststu =[SELECT First_Name__c, Last_Name__c, Gender__c FROM Student__c where  joining_date__c = today];
        for (student__c eachst : liststu){

            system.debug( 'Student Name : '+ eachst.first_name__c +' '+ eachst.last_name__c);
            system.debug( ' Gender: '+ eachst.Gender__c);
            system.debug('.........');

             }
          
        }
}