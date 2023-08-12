trigger CaseTrigger on Case (before insert, after insert, before update , after update, before delete , after delete) {

    if( Trigger.isBefore && Trigger.isInsert){
        for (Case newcase : Trigger.new){
            if (newcase.ContactId != null && newcase.Subject!= null){
                newcase.Priority = 'High';
            }
            if( newcase.ContactId != null && newcase.Subject== null){
                newcase.Priority='Normal';
            }
            if(newcase.ContactId == null && newcase.Subject!= null){
                newcase.Priority='Low';
            }
        }
    }
    
    //********************/
    
    // if (Trigger.isAfter && Trigger.isInsert){
    //     system.debug('Trigger After Insert Event ');
    //     }

    // if (Trigger.isBefore && Trigger.isInsert){
    //     system.debug('Trigger Before Insert Event ');
    //     }

    // if (Trigger.isBefore && Trigger.isUpdate){
    //     system.debug('Trigger Before Update Event ');
    //     }
    // if (Trigger.isAfter && Trigger.isUpdate){
    //     system.debug('Trigger After Update Event ');
    //      }


}