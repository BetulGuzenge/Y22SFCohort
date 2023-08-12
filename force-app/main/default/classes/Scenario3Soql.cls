public  class Scenario3Soql {
    public static List<account> fetchAccountWithIds(list<id> accIds) {

        list <account> ListAcc = [ select id ,Name , annualrevenue from account where id in:accIds];
        return ListAcc; 

    }
}