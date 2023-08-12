//********************* */
// We can create list of SObject to store more than one object record 
//WE can use this for HOMEWORK 15
list <account> listAccounts= [Select  id from account];
list <contact > cts =[ select id from contact where accountid =: listAccounts[0].id];

list<sobject> allRecords = new List <Sobject> ();
allRecords.addAll (listAccounts);
allRecords.addAll (cts);
system.debug (allRecords.size());
// **********************
 