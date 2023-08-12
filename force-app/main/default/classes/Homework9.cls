public class Homework9 {
    public static void empDetail(){
        department__c d1=[select id from Department__c where name__c='Information Technology'];
       

        date s = date.today();
        date firstdateofmonth= s.toStartOfMonth();

        
         Employee__c emp = new Employee__c (First_name__c= 'Dwayne', Last_name__c= 'Johnson' , salary__c= 100000, JoinDate__c = firstdateofmonth  ,Department__c= d1.id );
         insert emp;
         system.debug (emp);

         employee__c lastemp = [ select id from employee__c ORDER BY createddate desc LIMIT 1 ];
        system.debug (lastemp.id);
      
         
    }
}