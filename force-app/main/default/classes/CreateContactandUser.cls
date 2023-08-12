public  class CreateContactandUser {
    public static void performAction1( string lastName) {
        List<contact> newContacts = new list<contact>{
            
            new contact (
             Lastname = lastName, 
             phone ='12113123213')
            
           };

           insert newContacts;
           
           UserUtility.insertUser('idUser33', 'guzenge2@ca.com', 'identityuser2@con22.com', 'IdentityUser Demo3', 'Identitiy User', 'Eastern Sales Team');
   }
}