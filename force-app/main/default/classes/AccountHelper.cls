public class AccountHelper {


    // we are calling below method from FLOW when an account is created and the web site is empty
    
    @invocableMethod
    public static void accountWebsiteUpdate(List<id> accIds) {
        system.debug('invocable method called. AccIds are : ' + accIds);
        List<account> listAccountToUpdate = new list<account>();
        for (Id eachId : accIds) {
            Account ac = new account();
            ac.Id = eachId; //ID setting is mandatory to update accounts
            ac.Website = 'www.yoll.io';
            listAccountToUpdate.add(ac);
        }
        update listAccountToUpdate;
    }
}
