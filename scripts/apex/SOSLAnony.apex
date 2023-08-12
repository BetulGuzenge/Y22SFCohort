list<list<sObject>> allRecords =[ find 'yoll' IN ALL FIELDS returning account (id,name,website), contact(id, name, firstname, lastname)];

For(list<sObject> eachsObject : allRecords) {
    system.debug ('each object---> '+ eachsObject);
    for(sObject eachrecord: eachsObject){
        system.debug(' record: '+ eachrecord);
        system.debug ('name field value: '+ eachrecord.get('name'));
        system.debug ('id field value: '+ eachrecord.get('id'));
    }
}