public class StudentSOQL {
    public static void displaystudentnam() { 
        string query ='select Id, first_name__c .last_Name__c';

        for (string eachfield :fieldNames){
            query+=','+eachfield;
        }

        query += 'from' +sObjectName;

        List <sObject> listSO = database.query(query);
        for (SObject eachRec : listSO) {
            system.debug(eachRec);

            for (string eachField : fieldNames) {
                system.debug('===> fieldName: ' + eachField + ', value : ' + eachRec.get(eachField));

    }
}
    }}