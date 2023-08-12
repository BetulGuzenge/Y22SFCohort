public class QueueableTraining implements Queueable {
    public void execute(QueueableContext qc){

        //NEVER write SOQL or DML inside any LOOP. 
            //There is always some other way to implement it.

        List<AggregateResult> contactsGroupbyAcc = [select accountid, count(id) from contact where accountid !=null group by AccountId];
        // whenever we use group by it will return  List<AggregateResult> 

        List<account> accountsToUpdate = new list<account>();
        for (AggregateResult eachResult : contactsGroupbyAcc) {
            Account ac = new account();
            ac.id = (id)eachResult.get('accountid');// by writing (Id) we convert it from object to id . Otherwise we get errror 
            ac.Number_of_Contacts__c =  (decimal)eachResult.get('expr0');// by writing (decimal)) we convert it from object to decimal . Otherwise we get errror 
            accountsToUpdate.add(ac);
        }
        update accountsToUpdate;
    }
}

// the other way for this task we can use parent to child soql querry , Then we can have size to count contacts of an account
 