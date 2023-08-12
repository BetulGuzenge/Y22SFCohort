trigger EmployeeTrigger on Employee__c (before insert, before update, after insert, after update, before delete) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        //call method to update department's dept phone
        EmployeeTriggerHandler.UpdateDepartmentPhone(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
    }

    if(Trigger.isBefore && Trigger.isDelete){
        EmployeeTriggerHandler.ValidationDeleteEmployee   (Trigger.old, Trigger.oldMap);
        }

    
    }
