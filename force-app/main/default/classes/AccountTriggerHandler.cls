public class AccountTriggerHandler {

    public static void Accountvalidation1(list<account> AccTriggerNew){

            for (Account acc : AccTriggerNew){
                if( acc.Industry== null){
                    acc.Industry.addError('Industry can not be blank');
                }
                if(string.isBlank(acc.Rating)){
                    acc.Rating.addError('Rating can not be blank');
                }
                if(acc.annualrevenue <5000){
                    acc.annualrevenue.addError ('Revenue can not be less than 5000');
            } 
        }

    }

    public static void AccountValidation2(List<account> accTriggerNew, list<account> accTriggerOld, Map<id,account> accTtiggernewMap, Map<id,account> accTriggerOldMap){
        for (Account newAcc: accTriggerNew){//We have to write the first parametre
            //get old account name. Id of new and old record remains the same.
            Account oldAcc = accTriggerOldMap.get(newAcc.id);
            
            //to check if name is changed, just compare oldAcc name and New acc name
            if (oldAcc.Name != newAcc.Name) {
                //for insert and update.
                    //addError can be used on trigger.new or newmap 
                    //addError CANNOT be used with Trigger.old or oldmap
               newAcc.addError('CANNOT change Account name. Okay?');
            }
            

        }
    }

    //when user create an account ,create a related contact by default.
    //Since it is AFTER INSERT , we don't need old and oldMap

    public static void createrelatedcontact (list<account> accTriggerNew){
        list<contact> createContacts= new list<contact> ();
        for(Account eachAcc:accTriggerNew){
            //create contact record 

            Contact c =new contact (
                FirstName='Amir',
                LastName ='Khan',
                Email ='ak@ak.com',
                phone = '604121225',
                accountid= eachAcc.id
            );

            createcontacts.add (c);

        }
        try{
            insert (createcontacts);

        }catch(Exception ex){
            system.debug('Something went wrong' + ex.getMessage());
            for (Account eachAcc : accTriggerNew){
                eachAcc.addError(' Not able to create default contact.Please contact your admin, not developer');
            }
        }
        
    }
    public static void createrelatedopportunity(list<account> accTriggerNew){
        
        list<opportunity> opp =new list <Opportunity>();
        for (account newAcc : accTriggerNew){

            opportunity a1 = new Opportunity(
                Name ='Opportunity1',
                StageName= 'Prospecting',
                CloseDate= date.newInstance(2023, 12, 12),
                AccountId=newAcc.Id

            );
            opp.add(a1);
 
        }try{
            insert (opp);
        }
        catch (Exception ex ){
            system.debug('Something went  wrong '+ ex.getMessage());
            for(Account newAcc :accTriggerNew){
                newAcc.addError(' Not able to create default contact.Please contact your admin, not developer');

            }

            }
    }

        // update all related contact's phone number if account's phone is changed. 


        //**********BELOW VERY IMPORTANT *****************/

    public static void updateRelatedContactPhone(list<account> accTriggerNew, list<account> accTriggerOld, Map<id,account> accTriggernewMap, Map<id,account> accTriggerOldMap){
        
        //1st create set <id> to store account whose phone field has been  updated
        set<id> accIds = new set <id>();
        for (account  newAcc :accTriggerNew){
            //check if phone field is changed
            if (newAcc.phone != accTriggerOldMap.get(newAcc.id).phone){ // ==>>account oldacc = accTriggerOldMap.get(newAcc.id); therefore oldAcc.phone = accTriggerOldMap.get(newAcc.id).phone)
                accIds.add(newAcc.Id);
             
            }
           
        }
        

        if(!accids.isEmpty()){

        //2nd get all contacts of all the accounts in set<id> of step 1
        
        List <contact> allContacts = [select id ,lastname,AccountId from contact where AccountId in: accIds];

        //3rd update all contacts with respective accountsids

        for(Contact eachcontact :allContacts){
            //get account phone field here
            account newAccount =accTriggernewMap.get(eachContact.AccountId);
            eachcontact.phone =newAccount.phone;
        }

        update allContacts;
        
        }

}
    public static void changingdescriptionforanyupdate(list<account> accTriggerNew ,list<account> accTriggerOld, Map<id,account> accTriggernewMap, Map<id,account> accTriggerOldMap){

        for (Account newacc : accTriggerNew){
            if(accTriggerOldMap.get(newAcc.id).Rating != newacc.Rating ){
                newacc.Description += 'Rating updated  ' + accTriggerOldMap.get(newAcc.id).Rating + '  to  '+ newacc.Rating + '  ';
            }

            if(accTriggerOldMap.get(newAcc.id).Industry != newacc.Industry ){
                newacc.Description += 'Industry updated  ' + accTriggerOldMap.get(newAcc.id). Industry + ' to '+ newacc.Industry + ' ';
            }

            if(accTriggerOldMap.get(newAcc.id).Ownership != newacc.Ownership ){
                newacc.Description += 'Ownership updated  ' + accTriggerOldMap.get(newAcc.id). Ownership + ' to '+ newacc.Ownership + ' ';
            }

            system.debug (newacc.Description);
            
        }
    }

    public static void validateACCDelete (List<account> AccTriggerOld){
        //when we are deleting record 
        // we can throw error using trigger.old or trigger . OldMap  ( There is no Map// But for other events we have to use NEW )

        for (account oldAcc : AccTriggerOld){
            if(oldAcc.active__c == 'Yes'){
                oldAcc.addError('Cannot Delete Active Account');
            }
        }
    }

    //***************MY APPROACH!!!!!!!!!!NEVER USE DML or QUERY IN FOR LOOP****************/
    // public static void validateACCDelete2(List <account> AccTriggerOld){

    //     for(account oldAcc : AccTriggerOld){
    //         list<contact> con= [select id,name from contact where id = :  oldAcc.Id];
    //         if(con != null){
    //             oldAcc.addError('This account is associated with a contact or an opportunity! It can not be deleted');
    //         }
    //         list<Opportunity> opp = [select id from opportunity where id = : oldAcc.Id];
    //         if(opp != null){
    //             oldAcc.addError('This account is associated with a contact or an opportunity! It can not be deleted');
    //         }

    //     }
    // }

    // **************VITAP'S APPROACH *******************

    public static void validateAccDelete2(List<account> accTriggerOld, Map<id, account> accTriggerOldMap) {
        list<account> allAccDetails = [select id, name, 
                                 (select id from contacts), 
                                 (select id from Opportunities) 
                                 from account where id in :accTriggerOldMap.keySet()];
         for (account eachAcc : allAccDetails) {
             
             integer countContact = eachAcc.contacts.size();
             integer countOpp = eachAcc.Opportunities.size();
             if (countContact > 0 || countOpp > 0) {
                 account oldAcc = accTriggerOldMap.get(eachAcc.Id);
                 oldAcc.addError('Cannot delete account. Account is associated with Contact or Opportunity');
             }
         }
    }

    public static void DeleteRelatedContacts(List<account> accTriggerOld, Map<id, account> accTriggerOldMap){
        //get set of accountIds for which we want to delete contacts
        set<id> accountIds= accTriggerOldMap.keyset();
        list <contact> getcontacts =[select id from contact where AccountId in :accountIds];

        delete getcontacts;

    }
    
   
}