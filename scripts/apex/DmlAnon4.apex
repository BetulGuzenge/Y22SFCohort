List<account> newAccounts = new list<account>{
    new account(name = 'ac1'), //innocent
    new account(name = 'ac2'),
    new account()
};
//insert newAccounts; //how many accounts will be inserted?

Database.insert(newAccounts, false);