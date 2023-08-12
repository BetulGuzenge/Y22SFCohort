Account a = [select id from account limit 1];
List<Opportunity> createNewOpps = new List<Opportunity>();

       for(integer i = 0; i < 400; i++) {
            Opportunity op = new Opportunity();
            op.Name = 'Opportunity 1';
            op.AccountId = a.Id;
            op.CloseDate = date.today();
            op.StageName = 'Qualification';
            createNewOpps.add(op);
        }
        if (!createNewOpps.isEmpty()) {
            insert createNewOpps;
        } 