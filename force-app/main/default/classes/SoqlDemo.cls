public  class SoqlDemo {
    public static void queryExample1(){
        list<account> l1 = [select id, name from account];
        system.debug(l1);

        for( account eachAccount: l1){
            //system.debug(eachAccount);
            string name = eachAccount.Name;
            system.debug('name of account is ' + name);
        }
   }
}