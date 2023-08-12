List<contact>allContacts =[select id, name, phone from contact where phone != null];

ContactUpdateQueueable cq=new ContactUpdateQueueable (allContacts);
system.enqueueJob(cq);

system.enqueueJob(new QueueableTraining());

// List<account> accountToContacts = [select id, (select id from contacts) from account];
//         for (account eachAcc : accountToContacts) {
//             if (eachAcc.Contacts != null) {
//                 integer cc = eachAcc.Contacts.size();
//             }
//         }

id jobIdAssignment4 = system.enqueueJob(new QueueableTraining());// we can the job id 
AsyncApexJob aaj =[select id,numberoferrors, status from asyncApexJob where id = :jobIdAssignment4 ];// wecan get the number of error 
system.debug(aaj);


AsyncApexJob aaj2 =[select id, numberoferrors, status from asyncApexJob where id = '707Do00001RoKgrIAF' ];// wecan get the number of error 
system.debug(aaj2);
    