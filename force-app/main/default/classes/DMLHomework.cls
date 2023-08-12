public with sharing class DMLHomework {
    public static void homework8(){

        Student__c st1 = new Student__c (First_name__c = 'Harry', Last_name__c='Potter', Age__c=11, Joining_Date__c= date.today(), Gender__c='male', classroom__c = 'a02Do000001i7gXIAQ' );
        insert st1;

        system.debug('before update' + st1);

        list <Sobject> l1 = [select id, first_name__c , last_name__c, age__c from Student__c where first_name__c='Harry'];

        system.debug(l1);

        list<student__c> newlist = new list<student__c>();

        for (Sobject eachst : l1){
          
          student__c s =(student__c) eachst ;
          if (s.first_name__c == 'Harry' && s.last_name__c== ' Potter'){
            s.age__c=12;
            newlist.add(s);
            
          }
        }

        update newlist;
        system.debug ('after update'+ newlist);
    
    }

}