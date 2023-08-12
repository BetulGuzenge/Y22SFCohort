public class BatchAccountUpdate implements database.batchable<sObject>, database.stateful {//database.stateful gives us the statistic. if we want to count all updated record we create integer and must add database.stateful

    //count number of accounts updated
    integer totalRecordsUpdated = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){//querylocator devides the records in groups of records//we must pass Database.BatchableContext bc ==>this a kind of variable which batch will undertand how many records will be executed behind the seen 
        system.debug('start method of batch called.');
        //we write SOQL query.
        Database.QueryLocator allRecords = Database.getQueryLocator('Select id, name, rating, industry, Description, active__c from account');//
        return allRecords;
    }

    public void execute(Database.BatchableContext bc, List<Account> listAcc){// each batch will be here as parameter
        system.debug('execute method called.');
        list<account> updateAcc= new list<account>();
        for (Account eachAcc : listAcc) {
            if(eachAcc.active__c == null){
                eachAcc.Description += ' updated via batch --yoll';
                if (eachAcc.rating == null) {
                    eachAcc.rating = 'Warm';
                }
                if (eachAcc.Industry == null) {
                    eachAcc.Industry = 'Agriculture';
                }
                updateAcc.add(eachAcc);
            }
        }
        update updateAcc;
        
        system.debug('listAcc updated : number of records ==> ' + updateAcc.size());// THIS GIVES UPDATED RECORDS IN ONLY ONE BATCH 
        totalRecordsUpdated += updateAcc.size();
        system.debug('inside execute: total records updated till now: ' + totalRecordsUpdated);//THIS GIVES UPDATED RECORDS IN ALL TOTAL BATCHES
    }

    public void finish(Database.BatchableContext bc){
        system.debug('Batch is completed. Enjoy. Good job.');
        system.debug('inside FINISH: total records updated FINAL RESULTs are.... ' + totalRecordsUpdated);
    }
    
}



/*
System.Iterable<SObject> Database.Batchable<SObject>.start(Database.BatchableContext) 
void Database.Batchable<SObject>.finish(Database.BatchableContext)                    
void Database.Batchable<SObject>.execute(Database.BatchableContext, List<SObject>) 

*/