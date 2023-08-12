public class ContactTriggerHandler {
    public static void creatingerrorifthecontactphoneisempty(list<contact> conTriggerNew){

        for (Contact newcon: conTriggerNew){
            If (newcon.phone == null){
                newcon.addError('A contact record should have a phone number to be created');
            }
        }

    }

    //we will send an email to user when contact is restored.
    public static void sendEmailOnRestore (list<contact> ctTriggerNew , map<id,contact> TriggerNweMap ){

        list<messaging.SingleEmailMessage> listEmails = new List <Messaging.SingleEmailMessage>();

        for(contact newcontact : ctTriggerNew){
            list<string> emailaddress = new list<string>{UserInfo.getUserEmail()} ;

            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            msg.setToAddresses(emailaddress);//listof EmailAddress. or id of user, lead , or contact
            msg.setSubject('Contact is restored: contact last name is '+ newcontact.LastName);
            msg.setPlainTextBody('Hello '+ userInfo.getName() + ' You have successfully restored a contact!');

            listEmails.add(msg);
        }

        Messaging.sendEmail(listEmails);

    }

    public static void Preventrecursion (list<contact> conTriggerNew){
        
        list<Contact> tobeupdated = new List <contact>();

        for ( Contact eachcon: conTriggerNew){
            Contact con = new Contact (Id=eachcon.Id);
            con.Last_Review_Date__c = Date.today();
            tobeupdated.add(con);
        }

        if(tobeupdated.size() >0){
            update tobeupdated;
        }

    }
}