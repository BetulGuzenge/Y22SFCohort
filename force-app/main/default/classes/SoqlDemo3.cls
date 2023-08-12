public class SoqlDemo3 {
    public static void aggregateSoql1(){
        list <aggregateresult> listAg =[select country__c, count(id), sum(salary__c) from employee__c group by country__c];
        //we want to print each result one by one 
        for (aggregateresult ag: listAg){
            system.debug ('ag: '+ ag);
            system.debug ('country: '+ ag.get('country__c'));
            system.debug ('number of record: '+ ag.get('expr0'));
            system.debug ('sum of salary:  '+ ag.get('expr1'));
            
        }
    }

    public static void dynamicSoql1(list<string> fieldNames) {
        string query = 'select Id ';

        for (string eachField : fieldNames) {
            query += ',' + eachField;
        }

        query += ' from Employee__c';
        system.debug('FINAL QUERY IS ==> ' + query);

        List<Employee__c> listEMp = database.query(query);
        for (Employee__c emp : listEmp) {
            system.debug(emp);
        }
    }

    public static void aggregateSoql2(){

        List<aggregateresult> listAg = [select Department__r.name__c dept, count(id), sum(salary__c) from employee__c group by Department__r.name__c];
            //we want to print each result one by one
        for(aggregateresult ag: listAg){
                system.debug('ag: ' + ag);
                system.debug('dept: ' + ag.get('dept'));
                system.debug('number of records: ' + ag.get('expr0'));//expression0
                system.debug('sum of salary: ' + ag.get('expr1'));//expression1
            }
        }
    

    public static void dynamicSoql2(list<string> fieldNames, string sObjectName) {
        string query = 'select Id ';

        for (string eachField : fieldNames) {
            query += ',' + eachField;
        }

        query += ' from ' + sObjectName;
        system.debug('FINAL QUERY IS ==> ' + query);

        List<SObject> listSO = database.query(query);
        
        for (SObject eachRec : listSO) {
            system.debug(eachRec);
            
            for (string eachField : fieldNames) {
                system.debug('===> fieldName: ' + eachField + ', value : ' + eachRec.get(eachField)); // not to me : see the anonymous class in code share )
            }
        }
    }

}
