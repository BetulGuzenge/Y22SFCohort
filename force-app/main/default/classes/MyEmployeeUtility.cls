public class MyEmployeeUtility {
    public class MyEmployeeUtilityException extends Exception {}

        public string fullname;
        public string country;
        public decimal salary;
        public string departmentname;

        public  MyEmployeeUtility (string firstname ,string lastname){
            
            list<employee__c> l1 = [select id, First_Name__c,Last_Name__c from employee__c where name=:fullname];
            this.fullname = firstname+ ' '+ lastname; 
 
       if (fullname== null){

                throw new MyEmployeeUtilityException(' Name does not exist');
            }
            else {
                this.fullname=fullname;
            }
        }
        
        public void show (){
            system.debug (fullname);

        }

    
}
