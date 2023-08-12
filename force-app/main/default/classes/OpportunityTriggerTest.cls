@isTest
public class OpportunityTriggerTest {
    @isTest
    public static void testOppInsert1() {
        Opportunity opp = new Opportunity ();
        opp.Name = ' new opp test';
        opp.CloseDate = date.today();
        opp.StageName = 'Prospecting';

        //call trigger 

        insert opp;

        // assert 
        assert.isNotNull(opp.id);

    }
}
