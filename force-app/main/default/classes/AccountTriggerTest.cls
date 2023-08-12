@isTest 
public with sharing class AccountTriggerTest {

    @isTest 
    public static void testMethod1() {

        //how to test trigger ?
        //insert/update /delete record 
        //single and bulk

        //prepare data 

        List<account> newAccounts = new list<account>{
            new account(name = 'apple', Rating = 'Hot', Industry = 'Energy'), 
            new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy'),
            new account(name = 'orange', Rating = 'Hot', Industry = 'Energy')
           
        };

        //dml is the call method step for trigger 

        insert newAccounts;

        //assert
        //assert that account is inserted succesfully. 

         list<account> allAccounts  = [ select id, name from account]; 
         assert.areEqual (3, allAccounts.size());



    }
}