public class DMLHomework10 {

    // My standart field is a simple number field that can be fiiled manually. Classroom field is more suitable to be called id by quering. 
    //So instead of Standart I used classroom filed . 
    public static void Homework10() {

        classroom__c c1= [ select id from Classroom__c where Name= 'Class5']; 
        id a = c1.id;
        system.debug(a);

        student__c st1= new student__c (First_name__c= ' John', last_name__c= 'Wick', Joining_date__c= date.newinstance(2023,01,06), Classroom__c = a);
        insert st1;
        system.debug(st1);

        Student__c laststu = [ select id from student__c ORDER BY createddate desc LIMIT 1 ];
        system.debug (laststu.id);

        }

    public static void Homework11(){
       list< employee__c > e1 = [select id, email__c, country__c from employee__c where First_name__c ='Dwayne' AND last_name__c='Johnson' ];

        system.debug(e1);

        for (employee__c eachemp: e1){
            eachemp.email__c = 'dwayne@johnson.com';
            eachemp.country__c= 'US';
        }

        update e1;
        list<employee__c > l2 =[select id, first_name__c,last_name__c,email__c, country__c from employee__c order by lastmodifieddate desc limit 2];
        system.debug (l2);
    } 

    // I have two record under same name . That is why i used list .

    public static void Homework12(){
        list <student__c> s1=[ select id,first_name__c , last_name__c,gender__c,age__c from student__c where first_name__c='John' AND last_name__c='Wick'];
        system.debug('before update => '+s1);

        for( student__c eachstudent :s1){
            eachstudent.age__c=10;
            eachstudent.gender__c='Male';
        }

        update (s1);

    list<student__c> l2 = [select first_name__c , last_name__c , gender__c , age__c from student__c where first_name__c='John' AND last_name__c='Wick' ];
    system.debug('after update=>'+l2);
    }

    public static void Homework13(){
       employee__c emp1= new employee__c ( first_name__c= 'Peter', Last_name__c='Parker ', Salary__c=235000);
       insert emp1;

       employee__c emp2 = new employee__c (first_name__c= 'David', last_name__c= 'Massey', Salary__c = 65000);

       emp1.email__c='peter@parker.com';

       list<employee__c> l1 = new list <Employee__c> {emp1, emp2} ;
       upsert l1;

       system.debug (l1);

      
    }

    public static void Homework14(){
        // My standart field is just simple number field. So I use classroom filed to get id . 
        student__c stu1= new student__c (First_name__c= 'Emma', Last_name__c= 'Watson',Age__c=11, classroom__c = 'a02Do000001i7gZIAQ');
        insert stu1;

        student__c stu2 = new student__c (First_name__c= 'Angelina', Last_name__c='Jolie',Age__c=13, Classroom__c='a02Do000001i7gaIAA');

        stu1.gender__c= 'Female';

        list<student__c> l1= new list<student__c>{stu1,stu2};
        upsert l1;

        system.debug(l1);
    }

    public static void Homework15(){
        
        list<employee__c> emp1= [select id from employee__c where first_name__c ='David' AND last_name__c='Massey'];
        system.debug(emp1);
        delete emp1;

      
    }

    }
 