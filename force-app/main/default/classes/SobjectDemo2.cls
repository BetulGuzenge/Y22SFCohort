public class SobjectDemo2 {

    public static void casting(){
 
          list<sobject> listSO = new list<sobject>{
              new account(name = 'Lacrose', website = 'www.lacrose.com'), //0
              new account(name = 'Lactose', website = 'www.lactose.com'), //1
              new contact(firstname = 'titan', LastName = 'king', email = 'tital@king.com'), //2
              new Department__c(Name__c = 'Training')
          };
          system.debug('before: ' + listSO);
          insert listSO;
          system.debug('after: ' + listSO);
  
          //we are trying to assign generic sobject to account
          account a1 = (account)listSO[0];
          account a2 = (account)listSO[1];
          contact c1 = (contact)listSO[2];
          system.debug('a1.name  : ' + a1.Name + ' & website ' + a1.Website);
          system.debug('a2.name  : ' + a2.Name + ' & website ' + a2.Website);
          system.debug('c1.name  : ' + c1.firstname + ' & email ' + c1.email);
  
          Department__c d1 = (Department__c)listSO[3];
          system.debug('d1.name  : ' + d1.name__c);
      }
    public static void assignment2(){
        list<sobject> listSO = new list<sobject>{
        new contact(firstname = 'alex', LastName = 'John') };
        insert listSo;

        system.debug(listSO);


  }
  public static void assignment3() {
    contact c1 = new contact(FirstName = 'David', LastName='Miller', email='david.miller@gmail.com');
    insert c1;

    //get or fetch records using SOQL.
    list<sobject> sCon = [select id, firstname, email from contact where email = 'david.miller@gmail.com'];

    list<contact> updateContacts = new list<contact>();
    for (sObject eachSO : sCon) {
        
        contact c = (contact)eachSo;
        if (c.firstname == 'David') {
            c.firstname = 'Dave';
            updateContacts.add(c);
        }
    }
    update updateContacts;
    system.debug('final contact list: ' + updateContacts);
}

public static void Homework7(){
    Employee__c emp = new Employee__c(First_name__c = 'Dwayne', last_name__c = 'Johnson', joinDate__c = date.today(), email__c = 'dwayne@jhonson.com');
    insert emp;
    list<SObject> SoEmp = [select id, First_name__c, last_name__c, email__c from Employee__c where email__c = 'dwayne@jhonson.com'];
    list<Employee__c> updatedEmp = new list<Employee__c>();
    for(SObject eachSo : SoEmp){
        Employee__c em = (Employee__c)eachSo;
        if(em.First_name__c == 'Dwayne' && em.last_name__c == 'Johnson'){
            em.First_name__c = 'The';
            em.last_name__c = 'Rock';
            updatedEmp.add(em);
        }
    }
    update updatedEmp;
    System.debug('First and Last Name: ' + updatedEmp);
}
}



