// The concept of IsTest
//1- Insert Data 
// 2- @startTest//can be done only one time for each method 
//3-call method
//4- stoptest
//5- assertion

// TEST SET UP METHOD // This method will be executing before any test method 
//prepare data . And we use it for full test class



@isTest
public class DmlDemo2Test {

    @TestSetup
    static void makeData(){
    account acc= new account ();
    acc.Name='ABC Corp';
    acc.Industry = 'Energy';
    acc.rating = 'Hot';
    insert acc;
   
}
    @isTest// whatever we update , insert in Test Method , it will stay inside of the method . It will not update/insert/ delete real org.
            // when we query any record in the next test method in the testClass will have unupdated records 
   private static void testDmlASsignment9pt2() {
        //prepare data. Because we can not access org's data. The reason is when we move from one org to other org there won't be same records
        // when we test it in sandbox , same record may  not exist in real org

        // account acc= new account ();// We comment out it since we created TestSEtup above
        // acc.Name='ABC Corp';
        // acc.Industry = 'Energy';
        // acc.rating = 'Hot';
        // insert acc;
        //after insertion, we will GET the ID.

        account acc =[select id from account limit 1];// this is going to fetch from top (@testsetup) // This line is added after when we learn @testsetup

        List<contact> createContacts = new list<contact>{
            new contact(FirstName = 'John', LastName = 'Mayor', phone='65432111', accountid = acc.Id),
            new contact(FirstName = 'Jane', LastName = 'Mayor', phone='65432111',accountid = acc.Id),
            new contact(FirstName = 'Manny', LastName = 'Mayor', phone='65432111',accountid = acc.Id),
            new contact(FirstName = 'Phil', LastName = 'Mayor',phone='65432111', accountid = acc.Id)
        };
        insert createContacts;

        //call method
        DmlDemo2.dmlAssignment9pt2();

        //assertion
        list<contact> allContacts = [select id, name, Last_Review_Date__c from contact where accountid = :acc.id];
        assert.isNotNull(allContacts);
        for (Contact eachContact : allContacts) {
            assert.areEqual(date.newInstance(1990, 01, 01), eachContact.Last_Review_Date__c);// first what we expecting , then the target field
        }
   }

   @isTest
   private static void testDmlASsignment9pt2V2() {
    //prepare data. Because we can not access org's data. The reason is when we move from one org to other org there won't be same records
    // when we test it in sandbox , same record may  not exist in real org

    // account acc= new account ();// we pasted it to create data @testsetup after some example. No need anymore if we have it above
    // acc.Name='ABC Corp';
    // acc.Industry = 'Energy';
    // acc.rating = 'Hot';
    // insert acc;
    //after insertion, we will GET the ID.

    account acc =[select id from account limit 1];
    
    List<contact> createContacts = new list<contact>();
    for (Integer i=0 ; i <500; i++){
        Contact c  = new contact ( FirstName= 'test', LastName='for loop'+ i , Phone = '7788445566'+i, AccountId = acc.id);
        createContacts.add(c);
    }

    insert createContacts;

    // we must prepare data in our test method 
    // while we are creating method , we are consuming limits
    // this will lead to LESS LIMITS available for our actual METHOD
    // then our method is below , will have remained part of the limits

    //Ex : we consumed 200 DMLs and 3 seconds of CPU TIME TILL HERE 

    Test.startTest();
    // When we use startTest and StopTest governore limit will be updated . The new governmnet limit will be assign as if we did not consume any limit above 

    //call method
    DmlDemo2.dmlAssignment9pt2();

    Test.stopTest();

    // After stop , it will continue with the remaining limits before startTest.

    //assertion
    list<contact> allContacts = [select id, name, Last_Review_Date__c from contact where accountid = :acc.id];
    assert.isNotNull(allContacts);
    for (Contact eachContact : allContacts) {
        assert.areEqual(date.newInstance(1990, 01, 01), eachContact.Last_Review_Date__c);// first what we expecting , then the target field
    }
}
}