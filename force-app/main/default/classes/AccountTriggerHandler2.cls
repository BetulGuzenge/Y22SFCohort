public class AccountTriggerHandler2 {
    public static void reassignRelatedOpps(list<account> accTriggerOld, Map <id,account> accTriggerOldMap ) {
        //get ID of temporary acc
        account tempAcc = [select id from account where name = 'temporary Account' limit 1];

        // get all opportunities of all deleted account 

        List<Opportunity> allOpps = [select id , accountId from Opportunity where accountId in : accTriggerOld];

        system.debug('number of opps: ' + allOpps);
        for (Opportunity eachOpp :allOpps){
            eachOpp.AccountId = tempAcc.Id;
        }

        update allOpps;
    }

    public static void sendemailtocontacts(list<account> accTriggerNew , map<id,account> accTriggerNewMap){

        list<Messaging.SingleEmailMessage> listEmails = new list <Messaging.SingleEmailMessage>();
        list<account> allAccDetails = [select id, name, 
                                 (select id from contacts) from account where id in :accTriggerNewMap.keySet()];

                set<id> accountIds= accTriggerNewMap.keyset();

                    for (account eachAcc : allAccDetails) {
                        integer countContact = eachAcc.contacts.size();
                        if (countContact > 0 ) {
        
                            list <contact> getcontacts =[select id,Name,Email from contact where AccountId in :accountIds];
                             for (contact eachcon : getcontacts){
                                if(eachcon.Email != null) {
                                    list<string> emailaddress = new list <string>{eachcon.Email} ;
                                    Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                                    msg.setToAddresses(emailaddress);//listof EmailAddress. or id of user, lead , or contact
                                    msg.setSubject('Account is restored: ');
                                    msg.setPlainTextBody('Hello '+ eachcon.Name + ' Account has been successfully restored !');

                                    listEmails.add(msg);
                                }
                            
                            }

                             Messaging.sendEmail(listEmails);
                        }
                    }
    }

    public static void deleterelatedcontacsandopp(list<account> accTriggerOld , map<id,account> accTriggerOldMap){
       
        
       
        list<account> allAccDetails = [select id, name, 
                                    (select id from contacts), 
                                    (select id from Opportunities) 
                                    from account where id in :accTriggerOldMap.keySet()];
            
            list<contact> con = new list <contact>();
            list<Opportunity> opp = new list <Opportunity>();

            for (account eachAcc : allAccDetails) {
                                         
                integer countContact = eachAcc.contacts.size();
                integer countOpp = eachAcc.Opportunities.size();
                    if (countContact > 0 || countOpp > 0) {
                        list<contact> allrelatedcon = [select id from Contact where id IN: accTriggerOldMap.keySet()];
                        con.addAll (allrelatedcon);
                        List<Opportunity>allrelatedopp = [select id from Opportunity where id IN: accTriggerOldMap.keySet()];
                        opp.addAll (allrelatedopp);

                
                    }
            }          
                
                delete con;
                delete opp;
    }
}

            
             

    
