@isTest
public class Scenario1Test {
    @isTest
    private static void testAccInsert1() {
        List<string> allNames = new list<string>{'Andrew', 'Dan', 'Appleman', 'Fawcett'};
        Scenario1.insertAccounts(allNames);

        //assertion
        //check if account records are created.
        list<account> allAccounts = [select id, name from account];

        for (Account eachAcc : allAccounts) {
            //name of account is present in allNames list
            assert.isTrue(allNames.contains(eachAcc.Name));
        }
    }
}