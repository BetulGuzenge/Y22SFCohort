list <list<SObject>> allrecords =[ find 'Smith ' IN ALL FIELDS returning contact(firstname, lastname), Lead (firstname, lastname)];

for ( list<Sobject> eachObject : allrecords){
    for (sObject eachrecord : eachObject){
        system.debug (eachrecord);
    }
}



// all records-->
//0 index we have account record 
//1 index we have lead record 

list<sObject> accrecords = allrecords[0];
for (sObject eachAcc : accRecords){
    Account actualAcc = (account) eacAcc;
    system.debug( actualAcc.Name);
}
list<sObject> leadrecords =allrecords [1];


