public class Sobjecthomeworks {
    public static void Homework6() {
        list <sObject> stulist= new list<sObject>{
            new student__c (first_name__c ='Bianca', last_name__c = ' Fox ',age__c= 21, Joining_Date__c= date.newInstance(2021,1,15)  ,Gender__c='Female', classroom__c= 'a02Do000001i7gZIAQ')
        };

        insert stulist;
        system.debug (stulist);

        student__c s1= (student__c)stulist[0];

        system.debug(s1.First_name__c +' '+ s1.last_name__c+' '+ s1.classroom__c);

    }

    
}



