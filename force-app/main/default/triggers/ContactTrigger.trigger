trigger ContactTrigger on Contact (before insert, before update, after insert, after update,after undelete) {

    if(Trigger.isBefore&& Trigger.isInsert){

    // ContactTriggerHandler.creatingerrorifthecontactphoneisempty(Trigger.new);
    }

    if( Trigger.isAfter && Trigger.isInsert){//After Trigger is always read only .We can not call asynchronize method before trigger 
        //Since after trigger is readonly we have to write a query to call the queueable method 
        // list<contact>allContacts =[select id, name, phone from contact where id in:trigger.new];
        // ContactUpdateQueueable cq = new ContactUpdateQueueable(allContacts);
        // system.enqueueJob(cq);
    }

    system.debug('Trigger.Operation Type enum: ' + trigger.operationType);

    switch on Trigger.OperationType{// Trigger operation type is enum here
        when BEFORE_INSERT{
            system.debug ('before insert trigger called');
            ContactTriggerHandler.creatingerrorifthecontactphoneisempty(Trigger.new);
        }
        when AFTER_INSERT{
            system.debug('after insert trigger called');
            list<contact>allContacts =[select id, name, phone from contact where id in:trigger.new];
        ContactUpdateQueueable cq = new ContactUpdateQueueable(allContacts);
        system.enqueueJob(cq);
        }
    }

    If( Trigger.isUndelete){
        system.debug('undelete contact record ');
        ContactTriggerHandler.sendEmailOnRestore(Trigger.New, Trigger.newMap);
       
    }

    if (Trigger.isAfter && Trigger.isUpdate){

        
        if( ! PreventRecursionContact.firstcall){
            PreventRecursionContact.firstcall = true;
            ContactTriggerHandler.Preventrecursion(Trigger.new);
        }
    }


    

    //*******Attention , NOTES FROM 1ST OF JULY  */
    //when contact is inserted or updated , if Title is blank, then update default title as ' Manager'

    //when contact is inserted/updated, if Title is blank, then update default title as 'Manager'
    //before or after?
        //before
        //why? update (or populate in same record)
    //insert or update? or both?
        //both.
    
    //Can we do it in after?
        //yes. not efficient. but we can if we want to.
    
        // if (Trigger.isAfter) {

            //WE SHOULD DO THIS REQUIREMENT (CHANGING EMPTY FIELD WITH DEFAULT VALUE ) BEFORE INSERT/UPDATE . IF WE TRY TO DO AFTER EVENT HERE IS THE WRONG AND CORRECT WAYS 
            //Trigger.new and Trigger.newMap is READONLY in after triggers.
                //because record is already saved in database by the time it reaches after trigger
        /***********wRONG WAY==>DO NOT DO LIKE BELOW 3 LINES CODE . IT WILL GIVE ERROR SINCE TRIGGER.NEW IS READOLNLY AFTER SAVING */
            // for (Contact newContact : Trigger.new) {
            //     if(string.isblank(newContact.Title)){
            //         newContact.Title ='Manager';
            //     }
            // }
                    //********CORRECT WAY(NOT RECOMMENDED) *****/
            // SINCE WE CAN NOT UPDATE TRIGGER.NEW AFTER EVENT , WE CREATE NEWINSTANCE OF THE OBJECT
        //     List<contact> updateCts = new list<contact>();
        //     for (Contact newContact : Trigger.new) {
        //         if(string.isblank(newContact.Title)){
        //             Contact c = new contact();
        //             c.id = newContact.Id;
        //             c.title = 'Manager';
        //             updateCts.add(c);
        //         }
        //     }
        //     update updateCts;
            
        // }
    



    // //*************HOMEWORK******************* */

    // // if ( Trigger.isAfter && Trigger.isInsert){
    //     system.debug('Trigger After Insert Event');
    // }

    // if ( Trigger.isBefore && Trigger.isInsert){
    //     system.debug('Trigger Before Insert Event');
    // }

    
    // if ( Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('Trigger Before Update Event');
    // }

    
    // if ( Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('Trigger Before Insert Event');
    // }

    // //********************************************/
    // //21ST OF JUNE<<<========
  


    // if ( Trigger.isBefore && Trigger.isUpdate){
    //     Map <id,contact> contactNewMap=Trigger.newMap;// This is our map (FYI)
    //     //print old and new last name of the contacts.

    //     for( Contact contNew : Trigger.new){
    //         system.debug('New contact lastname and id ='+ contNew.LastName+ '-' + contNew.Id);
    //         Id contactId= contNew.Id;
          

    //         Contact newcontactRecord= Trigger.newMap.get(ContactId);
    //         system.debug('New Account from NEW MAP: ' + newcontactRecord);
    //           //system.debug('New account from NEW MAP: '+ contactNewMap.get(contNew.id));  
              
            
    //         Contact OldcontactRecord= Trigger.oldMap.get(ContactId);
    //         system.debug('Old Account from OLD MAP: ' + oldcontactRecord);

    //         system.debug('OLD contact LASTNAME:'+ oldcontactrecord.LastName);
    //         system.debug('OLD contact LASTNAME usual way:'+ Trigger.oldMap.get (contNew.Id).LastName);

        
    //     }

    //     system.debug('*************');

    //     // for( Contact contold : Trigger.old){
    //     //     system.debug('old contact lastname and id ='+ contOld.LastName+ '-' + contold.Id);
    //     // }
    // }

}