public class Assignment12 { 

    public static list <employee__c > show (string filtercountry  ) {

        // data binding // bind variable

        list<employee__c> l1 = [select first_name__c, last_name__c from employee__c where country__c=:filtercountry];
           return l1;
            
            }
    

    }
