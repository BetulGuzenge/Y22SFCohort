
@isTest
public class DmlDemo1Test {

    @isTest
    private static void testDml1(){
        // call method 
        DmlDemo1.dml1();// in this class we are creating one accoount.Will it create record in the or ? NO
                        // But It will create a method in its testing world
                        //Test class is connection to org to get metadata not data

        //verify
        // How to verify if data is being created?
        // ========> ANSWER :* SOQL*<======

        account acc = [ select Id , name from Account limit 1];
        //assert if name is Salesforce
        system.assertEquals('Salesforce', acc.name);
        assert.areEqual('Salesforce', acc.name);
    }

    @isTest
    private static void testDml2(){

        DmlDemo1.dml2();

        Department__c dept= [select name__c, short_code__c from Department__c limit 1];
       
        assert.areEqual('Human Resource', dept.Name__c);
        assert.areEqual('HR', dept.Short_Code__c);

                //*** 2. way to do this******/

                //         @isTest
                //    private static void testDml2() {
                //     //call method
                //         DmlDemo1.dml2();

                //     //assert
                //     list<department__c> d1 = [select name__c, short_code__c, id from department__c];
                //     system.assert(!d1.isEmpty());
                //     assert.areEqual('Human Resources', d1[0].name__c);
   }


    

    @istest
    private static void Testdml5(){
        //step:1 prepare data 
        //    prepare data : create data which is NEEDED for our method needs
        //step 2: call method (or test actual code )
        //1. create new instance of sobject
        account acc= new account();

        //2set filed names 
        acc.Name ='Test Account ';
        acc.Website= ' salesforce.com';
        acc.industry='Agriculture';
        acc.Rating='Warm';

        //dml
        insert acc;

        //step2: call method (or test actual code)
        DmlDemo1.dml5();
        //step3:assertion
        
        //verify if contact with lastname = biden is created or not
        contact c = [select id, lastname, accountid,phone from contact where lastname = 'Biden'];
        assert.areEqual(acc.id, c.accountid);
        assert.areEqual('78646213', c.phone);

    }
   
}