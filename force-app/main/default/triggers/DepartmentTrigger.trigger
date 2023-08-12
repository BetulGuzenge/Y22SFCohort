trigger DepartmentTrigger on Department__c (before insert, after insert , before update , after update) {

    if( Trigger.isAfter && Trigger.isUpdate){
        //it will check false, so that it executes only ONCE.
        if (DepartmentTriggerHandler.allEmployeeUpdated == false) {
            //call a method to update all employee's phone.
           DepartmentTriggerHandler.updateEmployeePhone(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
       }
      
   }
}