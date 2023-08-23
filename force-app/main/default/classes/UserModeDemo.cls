public with sharing class UserModeDemo {
    public static void sampleAccounts() {
         List<account> allAccounts = [select id, name, website, phone from account WITH SECURITY_ENFORCED];// avoid field level security
         system.debug(allAccounts);
    }

    public static void createAcc1() {
        Account acc = new account(name = 'test user mode', Website = 'www.user.mode');
        insert as User acc;
    }
    public static void createAcc2() {
        Account acc = new account(name = 'test user mode wo website', Industry = 'Energy', rating = 'Hot');
        insert as User acc;
    }
 
    public static void Assignment3 (){
        list<Account > a = [select id, name, website, phone from account WITH SECURITY_ENFORCED ];
        system.debug (a);
    }
    public static void Assignment3a (){
        list<Account > a = [select id, name, website, phone from account WITH USER_MODE ];
        system.debug (a);
    }
    public static void Assignment3b (){
        list<Account > a = [select id, name, website, phone from account WITH SYSTEM_MODE ];
        system.debug (a);
    }

    public static void Assignment5(){
        list<Employee__c> listemp = [ SELECT First_Name__c , Last_Name__c, Email__c , Department__c from Employee__c WITH USER_MODE];
        system.debug (listemp);
    }

    public static void Assignment6(){
        Employee__c newemp = new Employee__c (
            First_Name__c = 'Test emp',
            Last_Name__c = ' Test Last Name',
            Email__c = 'email.something@gmail.com', 
            Salary__c = 12000
        );
         INSERT as User newemp;
         

    }

    public static void createAcc3() {
        Account acc = new account(name = 'test user mode', Website = 'www.user.mode');
        database.SaveResult ds = database.insert(acc, false, AccessLevel.USER_MODE);// this will give error without FALSE since the user has no access the website field 
                                                                                    // WITH FRALSE EXECUTION WILL BE SUCCESS BUT IT WON'T INSERT SINCE THE USER HAS NO ACCEESS THE WEBSITE FIELD
        if (ds.isSuccess()) {
            system.debug('successfully inserted.');
        } else {
            system.debug('error it is');
        }
    }
    public static void createAcc4() {
        Account acc = new account(name = 'test user mode wo website', Industry = 'Energy', rating = 'Hot');
        database.SaveResult ds = database.insert(acc, false, AccessLevel.USER_MODE);
        if (ds.isSuccess()) {
            system.debug('successfully inserted.');
        } else {
            system.debug('error it is');
        }
    }

    public static void sampleAccounts5() {
        string accQuery = 'select id, name, website, phone from account';
        List<SObject> allAcc = Database.query(accQuery, AccessLevel.USER_MODE);// AccessLevel is recommended to be used // Access Level is Enum here
        system.debug(allAcc);
   }

   public static void Assignment7() {
    string empQuery = 'select First_Name__c, Last_Name__c, Email__c , Department__c , Salary__c from Employee__c where Salary__c> 200000';
        List<SObject> allemp = Database.query(empQuery, AccessLevel.USER_MODE);
        system.debug(allemp);
}
 


 }