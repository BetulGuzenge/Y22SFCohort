public class ContactUpdateQueueable implements Queueable {

    list <contact> contactsToUpdate = new  list<contact>();

    public ContactUpdateQueueable(list <contact> contactsToUpdate) {// we need one constructor 
        this.contactsToUpdate= contactsToUpdate;

    }

    public void execute (QueueableContext qc){
        // write logic to update contacts 

        for (contact eachContact : contactsToUpdate) {
            eachContact.Description = 'Updated via Queueuable';
        }
        update contactsToUpdate;
    }
}