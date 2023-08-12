public class Studentinfo4 {
    public static void show () {

        student__c  st= [ SELECT First_Name__c, Last_Name__c, Age__c FROM Student__c order by age__c DESC limit 1 offset 1];

        system.debug('Student Name: '+ st.first_name__c+' '+ st.last_name__c);
        system.debug ('Age: '+ st.age__c+' '+ 'years old.');

    }
}


