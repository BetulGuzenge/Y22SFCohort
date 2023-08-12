public with sharing class DmlDemo3 {
    public static void dmlUpsert1() {
        Contact c = new contact(FirstName = 'John', LastName = 'Cena');
        insert c;

        c.description = 'John Cenaaaa';
        
        Contact c2 = new contact(firstName = 'Sanjay', lastname = 'Patel');

        List<contact> listCon = new list<contact>{c, c2};

        system.debug('BEFORE UPSERT: listCon ==> ' + listCon);
        upsert listCon;
        system.debug('AFTER UPSERT: listCon ==> ' + listCon);
    }

    public static void dmlUpsert2() {
        list<contact> listCon = [select firstname, lastname, email from contact order by createddate desc limit 2];

        Contact c = new contact(FirstName = 'Don', LastName = 'Kixot');
        listCon.add(c);

        for (contact eachCon : listCon) {
            eachCon.email = eachCon.FirstName + '.' + eachCon.LastName + '@sfdc.com';
        }
        system.debug('BEFORE DML listCon: ' + listCon);
        upsert listCon; //update first 2 record from the list, and insert last record from the list
        system.debug('AFTER DML listCon: ' + listCon);

    }

    public static void dmlUpsert3() {
        

        Contact c = new contact(FirstName = 'Don', LastName = 'Lemon', email = 'Don.Lemon@sfdc.com', Description = 'Don last name is Lemon.');
        Contact c1 = new contact(FirstName = 'Don', LastName = 'Carolina', email = 'Don.Carolina@sfdc.com');

        List<contact> listCon = new list<contact>{c, c1};
        system.debug('BEFORE dml: ' + listCon);
        upsert listCon contact.fields.email;
        system.debug('AFTER dml: ' + listCon);
    }

    public static void assignment6(){
        Account newacc = new account(name='Alex');
        insert newacc;

        newacc.AccountNumber='sss22f';

        account acc2 = new account(Name= 'Jeff');
        list <account> l1= new list<account> {newacc,acc2};
        upsert l1;


    }

    public static void assignment8(){
        account acc1= new account (Name= 'Ronaldo');
        insert acc1; 

        delete [select id from account where name='Ronaldo'];

        list<account> l1 = [select id from account where name ='Ronaldo' all rows];
        undelete l1;
    }

    public static void homework14(){

        classroom__c id1 = [ select id from classroom__c where standart__c= 6];
        classroom__c id2 = [ select id from classroom__c where standart__c= 8];
    
        student__c stu1= new student__c (First_Name__c='Emma', Last_Name__c='Watson', Age__c=11, classroom__c = id1.id);
        insert stu1;

        student__c stu2= new student__c ( first_name__c= 'Angelina', Last_name__c=' Jolie', Age__c= 13 , classroom__c= id2.id);

        stu1.gender__c ='female';

        list<student__c> l1= new list <student__c> {stu1,stu2}; 
        upsert l1;
    }

  
}
