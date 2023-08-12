public class AccountInfo {
    public static void showParenttochild1() {

        list<account> listAcc = [select id, name, phone,(select name, email from contacts) from account]; 

        for ( Account eachAcc : listAcc){
            system.debug ( ' acc name : ' + eachACC + ' , acc phone ' + eachACC.Phone);

        list <contact> listContacts = eachAcc.Contacts;//list 
        integer totalContacts = listContacts.size();
        if (totalContacts >0){

        for (contact eachcontact : listContacts){
        system.debug ('contact name is ' + eachcontact.Name + ' , each contact email : '  + eachcontact.Email);}
       
    }
      else {
        system.debug ('**** No contacts');
      }

      system.debug('............');
    }
}

    //fetch all departments and its employees
    public static void showParentToChild2() {
        list<department__c> listDept = [select id, name__c, Short_Code__c, (select first_name__c, last_name__c, country__c, salary__c from employees__r) from department__c];
        
        for (Department__c eachDept : listDept) {
            system.debug('department name : ' + eachDept.Name__c + ', Short Code is ' + eachDept.Short_Code__c);

            List<Employee__c> listEmps = eachDept.Employees__r;
            Decimal totalSalary = 0;
            for (Employee__c eachEmp : listEmps) {
                system.debug('--> employee name is ' + eachEmp.First_Name__c + ' ' + eachEmp.Last_Name__c);
                system.debug('--> employee country and salary : ' + eachEmp.Country__c + ' ' + eachEmp.Salary__c);
                totalSalary += eachEmp.Salary__c;
            }
            system.debug('** total salary for ' + eachDept.Name__c + ' department is ' + totalSalary);
            system.debug('----');

    }
}

    public static list<account> showAccount (string filterindustry){
        list<account> filterAccounts = [select name, phone, website, industry, annualrevenue from account where Industry = :filterIndustry];
        
        return filterAccounts;

    }
}