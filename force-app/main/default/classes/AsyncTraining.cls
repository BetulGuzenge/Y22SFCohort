public class AsyncTraining {

    //future method must have @future annotation
    // Method mus t be static 
    // Method must not return anything

    // //search in student with Firstname or lastname as passes in string 

    // @future
    // public static void futureMethodDemo (string s) {

    //     system.debug ('future method called.String s is ...'+ s);


    // }

    //WE CAN NOT PASS SOBJECT OR OBJECT AS PARAMETRE IN FUTURE METHOD. ONLY PRIMITIVE META TYPES (OR CUSTOM CLASSES)
    //SOULUTION IS WE ALWAYS HAVE TO PASS ID 

    @future
    public static void updateDateFuture(Set<id> studentIds){
        List<Student__c> allStuds = [SELECT Id, First_Name__c, Joining_Date__c, Last_Name__c FROM Student__c where id in :studentIds];

        //update joining date to today's only when it is blank
        list<student__c> updateStuds = new list<Student__c>();
        for (Student__c eachStud : allStuds) {
            if (eachStud.Joining_Date__c == null) {
                eachStud.Joining_Date__c = date.today();
                updateStuds.add(eachStud);
            }
        }
        update updateStuds;

    }

    @future
    public static void assignment1Future(string accId){
        try {// it is very important to use try catch if there is any error behind the seen that does not reflect to user . So use try try catch
            if (string.isNotEmpty(accId)) {// we have to think all the possibilities so we need to check null possibility as well
                account acc = [select id, name from account where id = :accId];
                system.debug('acc name is ' + acc.Name);
            }
        } catch (Exception ex) {
            system.debug('something went wrong. Error message: ' + ex.getMessage());
        }
    }
    }



   
    
