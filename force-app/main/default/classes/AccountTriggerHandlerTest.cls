@isTest
public  class AccountTriggerHandlerTest {

    @TestSetup
    static void makeData(){

        List<account> newAccounts = new list<account>{
            new account(name = 'apple', Rating = 'Hot', Industry = 'Energy' , annualRevenue = 7000), 
            new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy', annualRevenue = 7000),
            new account(name = 'orange', Rating = 'Hot', Industry = 'Energy', annualRevenue = 7000)
        };

        insert newAccounts;
        
    }
    @isTest
    private static void testAccValidation1_1() {
        //we use try catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple', Rating = 'Hot', Industry = 'Energy' , annualRevenue = 3000), 
                new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy', annualRevenue = 3000),
                new account(name = 'orange', Rating = 'Hot', Industry = 'Energy', annualRevenue = 3000)
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Revenue can not be less than 5000'));
            //then our handler is doing what it is supposed to do.
        }
        
    }


    @isTest
    private static void testAccValidation1_2() {
        //we use try catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple',  Industry = 'Energy' , annualRevenue = 7000), 
                new account(name = 'mango' , Industry = 'Energy',  annualRevenue = 7000),
                new account(name = 'orange', Industry = 'Energy',  annualRevenue = 7000)
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Rating can not be blank'));
            //then our handler is doing what it is supposed to do.
        }
    }

    @isTest
    private static void testAccValidation1_3() {
        //we use try catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple',  Industry = ' ' , annualRevenue = 7000, Rating= 'Warm'), 
                new account(name = 'mango' , Industry = ' ',  annualRevenue = 7000,Rating= 'Warm'),
                new account(name = 'orange', Industry = ' ',  annualRevenue = 7000,Rating= 'Warm')
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Industry can not be blank'));
            //then our handler is doing what it is supposed to do.
        }
    }


    @isTest 
    private static void testDelValidate1(){
       // get all the accounts which are created in testSetup
       //update status to active 

       list<account> listAcc = [select id , name from account ];

       for( Account eachAcc: listAcc){
        eachAcc.active__c = 'Yes';

        }

      update listAcc;

      list<account> listAcc2 =[select id, name from account ];

      try {
      delete listAcc2; 
      }
      catch (Exception ex){

         assert.isTrue (ex.getMessage().contains('Cannot Delete Active Account'));

      }

        //delete acc==> this will throw error and we will catch it 

     }

   @isTest 
   private static void testUpdatePhone1(){
    // get account
    
    list<account> listAcc= [select id, name from Account];
    // create some contact 200 contacts for each acc==> we are creating at least 100 record to chekc bulk record
    list<contact> createContact = new list<contact>();
    
    for (Integer i=0; i<600 ; i++){
        contact c = new contact (
        FirstName = 'TEST',
        LastName ='Testman',
        Email= 'ak@testman.com',
        phone = '7898956565'
    );

    if(i<200){
        c.AccountId = listAcc[0].id;
    }
     else if(i<400){
        c.AccountId = listAcc[1].id;
    }else{
        c.AccountId = listAcc[2].id;
    }

          
        createContact.add(c);
        }

        insert createContact;

    for (Account eachAcc: listAcc){
        eachAcc.phone='2255889966';
    }
       try{

        update listAcc;

       }

       catch (Exception ex){
        list<contact> allContacts = [select id,FirstName ,phone , accountid from contact];
        for (Contact eachcon :allContacts){
            assert.areEqual('2255889966', eachcon.Phone);
        }
       }
    
        

       
    }

   }


