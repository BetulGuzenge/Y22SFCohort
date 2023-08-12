public  class MyEmpUtility{    


         string fullname;
         string country;
         decimal salary;
         string departmentname;

        public MyEmpUtility (string firstname ,string lastname){
            this.fullname = firstname+ ' '+ lastname; 
            list<employee__c> l1 = [select id, First_Name__c,Last_Name__c from employee__c where name=: fullname];
            
 
       if ( l1 == null){

                throw new MyEmpUtilityException('Name does not exist');
            }
            else {
                this.fullname=fullname;
            }
        }
        
        public void show (){
            system.debug (fullname);

        }
    }

    

