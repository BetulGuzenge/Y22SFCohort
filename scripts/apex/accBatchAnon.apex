// BatchAccountUpdate ba = new BatchAccountUpdate();
// Id jobId = database.executeBatch(ba, 30);//max we can write 2000, by default it is 200
// system.debug('apex job id ==> ' + jobId);


QueueableExample1 qe1 = new QueueableExample1();
Id jobIdQ = System.enqueueJob(qe1); //we can enqueue only those classes which are implementing queueable

// Account a = [select id,name from account limit 1];
// system.debug(a);
// List<Opportunity> createNewOpps = new List<Opportunity>();

//        for(integer i = 0; i < 400; i++) {
//             Opportunity op = new Opportunity();
//             op.Name = 'Opportunity' + i;
//             op.AccountId = a.Id;
//             op.CloseDate = date.today();
//             op.StageName = 'Qualification';
//             createNewOpps.add(op);
//         }
//         if (!createNewOpps.isEmpty()) {
//             insert createNewOpps;
//         } 

//         BatchOpportunityUpdate op = new BatchOpportunityUpdate();
//         Id jobId = database.executeBatch(op, 50);//max we can write 2000, by default it is 200
//         system.debug('apex job id ==> ' + jobId);