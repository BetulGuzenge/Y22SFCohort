public class AccountTriggerHandler {
    public static void AccountValidation1(List<account> accTriggerNew) {

        for (Account eachacc : accTriggerNew){
            if (eachacc.Rating==null){// we can also state if condition like following ====>if( string.isblank(eachacc.Rating)){}
                eachacc.Rating.addError('Rating can not be blank');
            }

            if (eachacc.Industry == null){
                eachacc.Industry.addError('Industry can not be blank');
            }

            // if (eachacc.Rating==null && eachacc.Industry==null){
            //     eachacc.addError('Industry and Rating can not be Blank');
            // }
        }

    }

    public static void ValidateAccDelete(list <account> accTriggerOld) {
        //when we are deleting record.
        //we can throw error on trigger.old or oldmap. [there is NO new.]
        for (account oldAcc : accTriggerOld) {
            if (oldAcc.Active__c == 'Yes') {
                oldAcc.addError('Cannot Delete Active account. Go away');
            }
        }
   }
//     //update all related contact's phone number if account's phone is changed
//    public static void updateRelatedContactPhone(List<account> accTriggerNew, List<account> accTriggerOld, 
//    Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {

//        //1st create set<id> to store account whose phone field is changed.
//        set<id> accIds = new set<id>();
//        for (account newAcc : accTriggerNew) {
//            Account oldAcc = accTriggerOldMap.get(newAcc.id);
//            //check if phone field is changed
//            if (newAcc.Phone != oldAcc.Phone) {
//                accIds.add(newAcc.Id);
//            }
//        }
//        system.debug('acc ids where phone field is changed: ' + accIds);
//        if (!accIds.isEmpty()) {
//            //2nd get all contacts of all the accounts in set<id> of step 1
//            List<contact> allContacts = [select id, lastname, AccountId from contact where AccountId in :accIds];

//            //3rd update all contacts with respective accountids.
//            for (Contact eachContact : allContacts) {
//                //get account phone field here.
//                account newAccount = accTriggerNewMap.get(eachContact.accountId);
//                eachContact.Phone = newAccount.Phone;
//            }
//            update allContacts;
//        }
//   }

// }
}