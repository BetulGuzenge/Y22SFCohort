public class SoqlHomeworks {
    public static void Homework5() {

       list <sobject> listSo= new list <sobject>{
        new employee__c (first_name__c='Betul',Last_name__c='Guzenge', Country__c ='Turkey', JoinDate__c= date.newinstance(2023,12,12), email__c='guzengebetul@gmail.com' , salary__c = 15000 )

       };

       system.debug (listSo);


       employee__c e1=(employee__c) listSo[0];
       system.debug('First Name : '+  e1.first_name__c +' '+ 'Last Name: '+ e1.last_name__c +' '+'Country: ' + e1.country__c +' '+ 'Join Date: ' + e1.joinDate__c+ ' '+'Email: ' + e1.email__c+' '+'Salary: ' + e1.salary__c);
      

    }
}