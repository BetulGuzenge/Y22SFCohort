public  class BatchOpportunityUpdate implements database.batchable<sObject>, database.stateful{
   integer totalRecordsUpdated=0;

    public Database.QueryLocator start(Database.BatchableContext op){
        Database.QueryLocator allRecords = Database.getQueryLocator('Select id, accountid, name, stagename from Opportunity where stagename=\'Qualification\'');
        return allRecords; 

    }

    public void execute(Database.BatchableContext op, List<Opportunity> listOpp ){
        list<opportunity> updateOpp = new list <opportunity>();
        for(opportunity eachopp : listOpp){
            
            eachopp.StageName='Need Analysis';           

            updateOpp.add(eachopp);
        }
        update updateOpp;

        totalRecordsUpdated+= updateopp.size();
        system.debug(totalRecordsUpdated);

    }
    public void finish(Database.BatchableContext bc){
        system.debug('Batch is completed. Enjoy. Good job.');
        system.debug('inside FINISH: total records updated FINAL RESULTs are.... ' + totalRecordsUpdated);
    }


}