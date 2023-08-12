Schema.describeSobjectResult scontactR= contact.sobjectType.getDescribe();
map<string,schema.SObjectField> scontactrfields = scontactR.fields.getmap();
for (string fieldkey: scontactrfields.keySet()){
    Schema.SObjectField sof =scontactrfields.get(fieldkey);

    schema.DescribeFieldResult eachfieldresult = sof.getDescribe();
    system.debug ('Name:' + eachfieldresult.getName());
    system.debug ('Label:'+ eachfieldresult.getLabel());
}