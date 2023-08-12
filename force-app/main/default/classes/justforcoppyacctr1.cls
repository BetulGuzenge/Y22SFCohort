// trigger AaccountTrigger on Account (before insert, after insert,before update ,after update) {

//     //*********Assignment 7**********
    
//      if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)){
 
//          AccountTriggerHandler.AccountValidation1(trigger.new);
         
//      }
 
//      if( Trigger.isBefore && Trigger.isDelete){
 
//          AccountTriggerHandler.validateAccDelete (Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap );
//      }
 
//      //**************************************
 
//      // ******** 24th June*************
 
//      // An other way to validation for updating account name  
     
//      // if(Trigger.isBefore && Trigger.isUpdate){
//      //     Map<Id,Account>newAccountMap= Trigger.newMap;
//      //     Map<Id,Account>oldAccountMap= Trigger.oldMap;
 
//      //     set<id> allids = newAccountMap.keySet();
//      //     set<id> allIdsOld= oldAccountMap.keySet(); //>>>>Ids (keys ) of oldMap and newMap are same .
 
//      //     for(Id accId : allIDs){
//      //         account newAccount = newAccountMap.get(accId);
//      //         account oldAccount = oldAccountMap.get(accId);
 
//      //         if( newAccount.Name != oldAccount.Name){
//      //             newAccoount.addError('CANNOT change account name');
//      //         }
//      //     }
//      // }
 
//      //  **********************************************************
 
 
 
 
//      // //****WARNING!!! IMPORTANT!!!! *********
//      //     If( Trigger.isBefore && Trigger.isUpdate){
 
//      //         Map<id,account> oldAccountMap=Trigger.oldMap;
 
//      //         //check if account name field is changed 
//      //         for(Account Newacc : Trigger.new){
//      //             system.debug('new acc name:'+ NewAcc.Name);
//      //             //get old account name using id since even if the name was changed the id remains same.
//      //             //Use map since the id is key in the map . 
 
//      //             Account oldAcc = oldAccountMap.get(newAcc.id);
 
//      //             // to check if name is changed 
 
//      //             if(oldAcc.Name != Newacc.Name){
//      //                 newAcc.addError('Cannot change account name.');
                    
//      //             }
//      //         }
//      //     }
 
 
//      //*********************
//      //HOW TO GET DATA WHICH IS BEING INSERTED OR UPDATED?
//      //TRIGGER.NEW
 
//      // When account is created and active__c field is selected as'Yes' , update description as' Account is now active! Enjoy' else 'Record Created'
 
//      // If(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
//      //      for(Account accNew: Trigger.new){
//      //         if(accNew.AnnualRevenue < 5000){
 
//      //             //accNew.addError ( 'Annual Revenue con not be less than 5000');
//      //             accNew.AnnualRevenue.addError('Annual Revenue can not be less than 5000. ');
 
//      //         }
//      //     }
//      //     }
 
//      //******************* */
 
     
     
//      //  If(Trigger.isBefore && Trigger.isInsert){
//      //     for(Account acc: Trigger.new){
//      //         acc.Description='Record Created';
//      //        if( acc.active__c == 'yes'){
//      //         acc.description = ' Account is now active. Enjoy buddy!';
//      //        }
//      //     }
//      // }
 
//      // List<account> newAccounts= Trigger.new;
//      //  //Map <id,account>
//      //         //record ID as key 
//      //         // reacord itself as value
//      // Map<id,account> newAccountsMap = Trigger.newMap;
 
//      // List<account> oldAccounts= Trigger.old ;
//      // Map<id,account> oldAccountsMap= Trigger.oldMap;
 
//      // if( Trigger.isBefore && Trigger.isInsert){
//      //     system.debug('BEFORE INSERT-->');
//      //     system.debug( 'Trigger.New-->'+Trigger.new);
//      //     system.debug( 'Trigger.NewMap-->'+Trigger.newMap);
//      //     system.debug( 'Trigger.Old-->'+Trigger.old);
//      //     system.debug( 'Trigger.Oldmap -->'+Trigger.oldMap);
 
//      // }
 
//      // system.debug('******');
 
//      // if( Trigger.isAfter && Trigger.isInsert){
//      //     system.debug('AFTER INSERT-->');
//      //     system.debug( 'Trigger.New-->'+Trigger.new);
//      //     system.debug( 'Trigger.NewMap-->'+Trigger.newMap);
//      //     system.debug( 'Trigger.Old-->'+Trigger.old);
//      //     system.debug( 'Trigger.Oldmap -->'+Trigger.oldMap);
 
//      // }
 
 
//      // if( Trigger.isBefore && Trigger.isUpdate){
//      //     system.debug('BEFORE UPDATE-->');
//      //     system.debug( 'Trigger.New-->'+Trigger.new);
//      //     system.debug( 'Trigger.NewMap-->'+Trigger.newMap);
//      //     system.debug( 'Trigger.Old-->'+Trigger.old);
//      //     system.debug( 'Trigger.Oldmap -->'+Trigger.oldMap);
 
//      // }
 
//      // system.debug('*************');
 
//      // if( Trigger.isAfter && Trigger.isUpdate){
//      //     system.debug('AFTER UPDATE-->');
//      //     system.debug( 'Trigger.New-->'+Trigger.new);
//      //     system.debug( 'Trigger.NewMap-->'+Trigger.newMap);
//      //     system.debug( 'Trigger.Old-->'+Trigger.old);
//      //     system.debug( 'Trigger.Oldmap -->'+Trigger.oldMap);
 
//      // }
 
 
     
 
//      // If( Trigger.isBefore && Trigger.isInsert){
//      //     system.debug('account before insert trigger callled.');
 
//      //     //get data using trigger.new
 
//      //     system.debug('newly inserted account record (BEFORE):'+ trigger.new);
 
//      //     for (account newAcc: Trigger.new){
//      //         system.debug('newACC name:' + newAcc.name);
//      //     }
//      //     system.debug('newMap BEFORE->'+ Trigger.newMap);
//      //    system.debug('total records inserrted :'+ newAccounts.size());//List method list.size()
//      //     system.debug ('total records inserted (context variable trigger.size):'+ trigger.size);// trigger.size => variable 
        
     
 
//     /* If( Trigger.isAfter && Trigger.isInsert){
 
//          system.debug('account after insert trigger callled.');
 
//          //get data using trigger.new
 
//          system.debug('newly inserted account record(AFTER) :'+ trigger.new);
//          system.debug('newMap AFTER->'+ Trigger.newMap);
//          system.debug ('total records inserted (context variable trigger.size):'+trigger.size);
 
 
//      }
 
 
 
//      /* system.debug('Trigger isInsert will be true when we CREATE record -> ' + Trigger.isInsert);
//      system.debug('Trigger isUpdate will be true when we UPDATE record -> ' + Trigger.isUpdate);
 
//      //isbefore will be true when trigger is executing in Before context
//      if (trigger.isBefore && Trigger.isInsert){ 
//      // we want to print ONLY in before insert 
//      system.debug('account before insert trigger called');
//      }
 
//      if( Trigger.isBefore && trigger.isUpdate){
//      system.debug('account before update trigger called');
//      }
 
     
 
//      //Isafter will be true when Trigger is executing in After Context 
//      if (trigger.isAfter && Trigger.isInsert){
 
//      // we want to print below ONLY in after insert 
//      system.debug('account after insert trigger called');
//      }
 
//      if (Trigger.isAfter && Trigger.isUpdate){
//      system.debug('account after update trigger called');
//      }  
 
//  } */
//  //*****************************
 
//  // Salesforce allows us to create More than 1 trigger PER OBJECT. 
//  // BUT 
//  // WE SHOULD NOT CREATE MORE THAN ONE TRIGGER FOR ONE OBJECT ) 
 
//  //********************** 
 
 
 
//  /* NESTED IF ==> We can also use nested if to write the same trigger :
 
//  trigger AccountTrigger on Account (before insert, after insert, before update, after update) {
 
//      if (Trigger.isBefore) {
//          system.debug('BEFORE TRIGGER CALLED.');
//          if (Trigger.isInsert) {
//              system.debug('account before insert trigger called.');
//          } 
//          if(Trigger.isUpdate){
//              system.debug('account before Update trigger called.');
//          }
//      }
//      if (Trigger.isAfter) {
//           system.debug('AFTER TRIGGER CALLED.');
//          if (Trigger.isInsert) {
//              system.debug('account after insert trigger called.');
//          } 
//          if(Trigger.isUpdate){
//              system.debug('account after Update trigger called.');
//          }
//      }*/
//  }