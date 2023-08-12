public  class DmlDemo2 {
    public static void dmlAssignment4() {

        Classroom__c c6 =[select id, standart__c from classroom__c where standart__c=6 limit 1];

        student__c s1= new student__c();
        s1.first_name__c='Joe';
        s1.last_name__c='Bardin';
        s1.age__c =11;
        s1.classroom__c = c6.id;
        insert s1;

        system.debug ('new student id is ' + s1.id);

    }

    public static void dmlUpdate1(){
        account acc = new account();
        acc.Name = 'Salesforce';
        acc.Website = 'salesforce.com';
        insert acc;

        //set diffent values for some of the fields
        acc.name = 'Yoll';
        acc.Website = 'yoll.io';
        //dml to update
        update acc;
    }

    public static void dmlUpdate2(){
        //update acc record which is present in the org.
        account acc = [select id, name, website, active__c from account order by createddate desc limit 1];

        system.debug('before update dml: ' + acc);
        acc.name = 'Timex';
        acc.Website = 'timex.com';
        update acc;
        system.debug('after update dml: ' + acc);
    }

    public static void assignment5(){
        contact acc = new contact ();
        acc.FirstName='Sean';
        acc.LastName='Thomas'; 
        insert acc;

        contact c9 =[select id, firstname,lastname from contact order by CreatedDate desc limit 1];

        c9.FirstName='Aiden';
        update c9;

        

        
    }

    public static void dmlInsertMultipleRight() {
        List<account> listAcc = new list<account>();

        for (Integer i = 0; i < 155; i++) {
            account a = new account();
            a.Name = 'new acc ' + i;
            listAcc.add(a);
        }
        insert listAcc;
    }

    public static void dmlUpdateBulk1() {
        list<account> listAcc =[select id , name,active__c from account];
        for (account eachAcc : listAcc){
            if(string.isBlank(eachAcc.active__c)){
                eachAcc.active__c='No';
            }
        }

        update listAcc;
        system.debug(listAcc.size());

    }

    

    public static void studentjoiningdate() {
        list<student__c> liststu =[select id , name ,joining_date__c from student__c limit 10];
        for (student__c eachst : liststu){
            eachst.joining_date__c= date.today();
            }

            update liststu;
            system.debug (liststu);
        }

      

        // public static void examdetailinsert(){
        //     list <student__c> stu = [select id, first_name__c, last_name__c from student__c ];
        //     List<student__c> newList = new List<student__c>('');

        //     for(student__c  eachstu :stu){
        //        student__c student = new student__c();
        //     c.student__c = eachstu.First_name__c +' '+eachstu;
                
        //     }
        //     insert c;

            

        

        public static void dmlAssignment9pt2() {
            list<contact> allContacts = [select id, firstname, birthdate from contact where account.name = 'ABC Corp'];
            for (contact eachContact : allContacts) {
                eachContact.Last_Review_Date__c = date.newInstance(1990, 01, 01);
            }
            update allContacts;
        }

    }
        

       
        

    

    
