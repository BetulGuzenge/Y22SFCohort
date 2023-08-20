trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    //**************Start TRiggerHandler ********************/

    TriggerSwitch__mdt accTriggerSwitch = TriggerSwitch__mdt.getInstance('Account');
    if (!accTriggerSwitch.Enabled__c) {
        system.debug('Account trigger switch if OFF. Go back now.');
        return;
    } else {
        system.debug('Account trigger switch if ON. Pl cont....');
    }

    If( Trigger.isBefore && (Trigger.isInsert&& Trigger.isUpdate)){
        AccountTriggerHandler.Accountvalidation1(Trigger.new);
    }

    if ( Trigger.isbefore && Trigger.isUpdate){
        AccountTriggerHandler.AccountValidation2(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
        AccountTriggerHandler.changingdescriptionforanyupdate(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
    }

    if(Trigger.isBefore && Trigger.isDelete){
        //call method for validation if Acc is NOT active then only allow deleting
        // AccountTriggerHandler.validateACCDelete (Trigger.old);

         AccountTriggerHandler.validateACCDelete2 (Trigger.old, Trigger.oldMap);
        //commented out because it will not allow to delete if accoount has contacts. For other assignment we 

        // It is for , when an account is deleted all related opportunities will be assign to Temporary Account
        // AccountTriggerHandler2.reassignRelatedOpps(Trigger.old, Trigger.oldMap);
        
    }

    if (Trigger.isAfter ){
        if(Trigger.isInsert){
        AccountTriggerHandler.createrelatedcontact(Trigger.new);
        AccountTriggerHandler.createrelatedopportunity(Trigger.new);
        }
        if (Trigger.isUpdate){
        AccountTriggerHandler.updateRelatedContactPhone(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap );
        
        }

        if(Trigger.isDelete ){
            system.debug ('after delete account Trigger called');
        // AccountTriggerHandler.DeleteRelatedContacts(Trigger.old , Trigger.oldMap);
            AccountTriggerHandler2.deleterelatedcontacsandopp(Trigger.old , Trigger.oldMap);
        }

        if(Trigger.isAfter && Trigger.isUndelete){
            AccountTriggerHandler2.sendemailtocontacts(Trigger.New, Trigger.NewMap);
    
        }


    }

    






    //***********************/
    //ASSIGNMENT 7***********// Here ISBLANK METHOD HAS BEEN USED INSTEAD OF NULL

    // If( Trigger.isBefore && (Trigger.isInsert&& Trigger.isUpdate)){
    //     for (Account acc : Trigger.New){
    //         if( acc.Industry== null){
    //             acc.Industry.addError('Industry can not be blank');
    //         }
    //         if(string.isBlank(acc.Rating)){
    //             acc.Rating.addError('Rating can not be blank');
    //         }
    //     } 
    // }

    /////////******************************8*/

    // VERY IMPORTANT//////////////

    //ANOTHER WAY TO COMPARE OLD AND NEW RECORD USING KEYSET!!!!!!!!<<<<<<<<<====

    // if (Trigger.isBefore && Trigger.isUpdate){
    //     Map<id,account> newAccountMap = Trigger.newMap;
    //     Map<id,account> oldAccountMap = Trigger.oldMap; 
    //     // check if account name field changed 

    //     set<id> allIds = newAccountMap.keySet();// Ids of oldmap and newmap will be same 

    //     for (Id accId : allIds){
    //         account NewAccount = NewAccountMap.get(accId);
    //         account OldAccount = OldAccountMap.get(accId);

    //         if(NewAccount.name != OldAccount.Name){
    //             newAccount.addError ('Acount Name can not be changed ');
    //         }
    //     }
    // }






    //*****************************21ST OF JUNE********************


    //!!!!!!!!!!!!!!!!!!!!!!!!**********VERY IMPORTANT************!!!!!!!!!!

    // THIS IS THE SHORTES WAY TO COMPARE OLD AND NEW RECORD !!!!!!!!!!!(SAME THING WITH PREVIOUS CODE )

    // if (Trigger.isBefore && Trigger.isUpdate){

    //     for (Account newAcc : Trigger.new){
    //         if (Trigger.oldMap.get(newAcc.id).Name != newAcc.Name){
    //             newAcc.addError('Account name can not be changed');}
    //         }
    //     }

    //*******************************/

    // COMPARING OLD NAME OF ACCOUNT WITH NEW NAME OF ACCOUNT 

    // if (Trigger.isBefore && Trigger.isUpdate){
    //     Map <id,account> oldAccountMap = Trigger.oldMap;

    //     //check if account name is changed

    //     for (Account newAcc : Trigger.new){
    //         system.debug('new acc name :'+ newAcc.Name);
    //         // get old account name . Id if new and old account remain same 
    //         Account oldAcc= oldAccountMap.get(newAcc.id);
    //         system.debug (' old acc name:'+ oldAcc.Name);
    //         if (newAcc.Name != oldAcc.Name){
    //             newAcc.addError('Account name can not be changed');

    //             //====>>>> The other version of If condition as below 
    //             // if (Trigger.oldMap.get(newAcc.id).Name != newAcc.Name){
    //             //    newAcc.addError('Account name can not be changed');}

    //             // addERROR can not be used for Trigger.old or oldmap . Because old has already gone 
    //         }
    //     }

    // }

    //*********************** */
    //validation in trigger , we have to use .addError method in Trigger.new or newMap
    //we can addError in both BEFORE AND AFTER, but the recommended is BEFORE 

    // If ( Trigger.isBefore && (Trigger.isInsert && Trigger.isUpdate))
    // //check if the annual revenue is less than 5k then throw error
    //    for (Account Accnew : Trigger.new){
    //     if(Accnew.annualrevenue <5000){
    //         //throw error on Record 
    //         // Accnew.addError ('Revenue can not be less than 5000');
    //         Accnew.annualrevenue.addError ('Revenue can not be less than 5000');

    //     }
    // }

     //*************************
   
    //Homework5===========>>>>>>>>>>>> CHECK IT OUT LATER !!!!!!!!!!!!

    // If ( Trigger.isBefore && Trigger.isInsert)
    //      for (Account newacc : Trigger.new){

    //         if(newacc.ShippingAddress==null){
                          
    //             newacc.ShippingCity=newacc.BillingCity;
    //             newacc.ShippingStreet=newacc.BillingStreet;
    //             newacc.ShippingState=newacc.BillingState;
    //             newacc.ShippingPostalCode=newacc.BillingPostalCode;
    //             newacc.ShippingCountry=newacc.BillingCountry;

    //         }
    //     } 
        

       // ***********************************

    // If ( Trigger.isBefore && Trigger.isInsert)
    //     for (Account newacc : Trigger.new){
    //         newacc.Description = 'Record Created';
    //         if (newacc.Active__c =='Yes'){
    //             newacc.Description='Account has been created and active now';
    //         }
    //     }

    //****************************************

    // If ( Trigger.isBefore && Trigger.isInsert)
    //     for (Account newAcc : Trigger.new ){
    //         newAcc.Description = 'Record Created';
    //         newAcc.Rating ='Hot';
    //     }

        //***********************************/

    // // TRIGGER.NEW AND TRIGGER.OLD ALWAYS READ ONLY SINCE THEY HAVE ALREADY SAVED !!!!!!!!!!!!!!
    // //BELOW CODE DOES NOT ALLOW US TO SAVE RECORD SINCE IT IS TRIGGER.ISAFTER ( SAVED RECORD CAN NOT BE CHANGED )
    // If(Trigger.isAfter && Trigger.isInsert){
    //     //Trigger.new is READ ONLY AFTER Trigger
    //     for(Account newAcc : Trigger.new ){
    //         newAcc.Description = 'Description has been updated from trigger ';
    //         newAcc.Ownership ='Public';
    //     }
    // }

    //Note for myself ===> Context variables mean 'Trigger.before, trigger.old...' whatever which is TRIGGER.SOMETHING<====



    // <****************JUNE 17TH (1ST CLASS OF TRIGGER)**************>

    // <***IN THE BELOW WAY WE HAVE FILLED THE DISCRIPTION FIELD WHILE WE ARE CREATING THE RECORD****>

    // If(Trigger.isBefore && Trigger.isInsert){
    //     for(Account newAcc : Trigger.new ){
    //         newAcc.Description = 'Description has been updated from trigger ';
    //     }
    // }

    // <**********************>

   //<**********TRIGGER.NEW-TRIGGER.OLD**********>BELOW EXAMPLE FOR BEFORE EVENT . IF IT IS AFTER EVENT NEW VERSION AND OLD VERSION NEVER CHANGE.!!!!!!!!!!!!

   
//     List<account> newAccounts = Trigger.new; //The data type of trigger.new is list of account
//     //Map <id, account> 
//             //record id as KEY
//             //record itself as VALUE
//     Map<id,account> newAccountsMap = Trigger.newMap;

//     List<account> oldAccount= Trigger.old;
//     Map<id,account> oldAccountsMap = Trigger.oldMap;

//     if (Trigger.isBefore && Trigger.isInsert) {
//         system.debug('--BEFORE INSERT--');
//         system.debug('Trigger.New --> ' + Trigger.new);
//         for( account newAcc: trigger.new){
//             system.debug('new acc name: ' + newAcc.Name);
//             system.debug('new acc website: ' + newAcc.Website);
            
//         }
//         system.debug('Trigger.NewMap --> ' + Trigger.newMap);
//         system.debug('Trigger.old --> ' + Trigger.old);
//         system.debug('Trigger.oldMap --> ' + Trigger.oldMap);   

//     if(Trigger.isBefore && Trigger.isUpdate){
//         system.debug('BEFORE UPDATE');
//         system.debug('Trigger.New --> ' + Trigger.new);
//         for (Account oldAcc : trigger.old) {
//              system.debug('old acc name: ' + oldAcc.Name);
//              system.debug('old acc website: ' + oldAcc.Website);
//         system.debug('Trigger.NewMap --> ' + Trigger.newMap);
//         system.debug('Trigger.old --> ' + Trigger.old);
//         system.debug('Trigger.oldMap --> ' + Trigger.oldMap);
//     }
// }
//     }

//    <*******HOW TO PRINT INDIVIDUAL ACCOUNT (FOR LOOP)**************>
   
//     List<account> newAccounts = Trigger.new; //The data type of trigger.new is list of account
//     //Map <id, account> 
//             //record id as KEY
//             //record itself as VALUE
//     Map<id,account> newAccountsMap = Trigger.newMap;
    
//     if (Trigger.isBefore && Trigger.isInsert) {
//         system.debug('account before insert trigger called.');

//         //get data using trigger.new
//         system.debug('newly inserted account record (BEFORE): ' + newAccounts);
//         for (Account newAcc : Trigger.new) {
//             system.debug('newAcc name : ' + newAcc.Name);
//         }
//     }

//          //<**********HOE TO GET DATA WHICH IS BEING INSERTED OR UPDATED ************>
//     //<TRIGGER.NEW

//     List<account> newAccounts = Trigger.new; //The data type of trigger.new is list of account
//     //Map <id, account> 
//             //record id as KEY
//             //record itself as VALUE
//     Map<id,account> newAccountsMap = Trigger.newMap;
    
//     if (Trigger.isBefore && Trigger.isInsert) {
//         system.debug('account before insert trigger called.');

//         //get data using trigger.new
//         system.debug('newly inserted account record (BEFORE): ' + newAccounts);
//         for (Account newAcc : Trigger.new) {
//             system.debug('newAcc name : ' + newAcc.Name);
//         }

   

//     if( Trigger.isAfter && Trigger.isInsert){
       
//     //get data using trigger.new

//     system.debug('newly inserted account record (BEFORE)'+Trigger.new);//or (newly inserted account record (BEFORE)'+ newAccount);===>same thing because Trigger.new =list<account>
//     system.debug('newMap Before -->'+ trigger.newMap);// or newAccountsMap=trigger.newMap
//     system.debug ('total record inserted '+ newAccounts.size());
//     system.debug ('total record inserted (context variable trigger.size)'+ trigger.size); //NOte==>difference between theese two ==> newAccounts.size is a method but trigger.size shows context variable . They print sam thing
//     // This  map is <id,account>
//     //record id as key 
//     //record itself as Value

//     }

 
// }
// }




    // // <**************BELOW IS ANOTHER STYLE TO WRITE THE SAME CODE **************************>

    // if (Trigger.isBefore) {
    //     system.debug('BEFORE TRIGGER CALLED.');
    //     if (Trigger.isInsert) {
    //         system.debug('account before insert trigger called.');
    //     } 
    //     if(Trigger.isUpdate){
    //         system.debug('account before Update trigger called.');
    //     }
    // }
    // if (Trigger.isAfter) {
    //      system.debug('AFTER TRIGGER CALLED.');
    //     if (Trigger.isInsert) {
    //         system.debug('account after insert trigger called.');
    //     } 
    //     if(Trigger.isUpdate){
    //         system.debug('account after Update trigger called.');
    //     }
    // }


    // <*******************************************************>
    // system.debug('Trigger isInsert will be true when we CREATE record -> ' + Trigger.isInsert);
    // system.debug('Trigger isUpdate will be true when we UPDATE record -> ' + Trigger.isUpdate);
    // if(Trigger.isBefore && Trigger.isInsert){
    //     system.debug('account before insert trigger called.');
    // }
    // if(Trigger.isAfter && Trigger.isInsert){
    //     system.debug('account after insert trigger called.');
    // }

    //  if(Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('account before Update trigger called.');
    // }
    // if(Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('account after Update trigger called.');
    // }

    // system.debug('--------');

    //<*************************************>

    // //isAfter will be True when Trigger is executing in After Context (after insert or after update)
    // if(Trigger.isAfter){
    //     //we want to print below ONLY in after insert
    //     system.debug('account AFTER insert trigger called');
    //     system.debug('account AFTER UPDATE trigger called');
    // }
    // //isBefore will be True when Trigger is executing in Before context (before insert or before update)
    // if(Trigger.isBefore){
    //      //we want to print ONLY in before insert
    //     system.debug('account before insert trigger called.');
    //     system.debug('account BEFORE UPDATE trigger called.');
    // }

//Salesforce allows us to create More than 1 trigger PER OBJECT.
    //But
//WE SHOULD NOT. We should not create more than one trigger per sObject.
}