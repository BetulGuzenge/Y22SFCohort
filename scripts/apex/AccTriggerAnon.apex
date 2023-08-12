Account ac= new Account ( Name=' Acc new trg 5');
insert ac; 
system.debug ('*************');
ac.name =' acc new trg 5 v2';
update ac;

**********

List<Account> ac1 = new List<account>{
    new account(NAME = 'acc trgg 13'),
    new account(name = 'acc trgg 14'),
    new account(name = 'acc trgg 15')
};
insert ac1;

*************
Account acc1= new account ( Name=' Test 9th of July 1003', Rating='Hot', industry='Agriculture', BillingStreet =' Hazel Street', BillingState=  'BC', BillingCountry='Canada');
insert acc1; 