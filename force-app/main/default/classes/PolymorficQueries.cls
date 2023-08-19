queries 1 ==> select TYPEOF what when account then fax,name when opportunity then amount, name when case then subject END from event
queries 2==> select id, subject from event where what.type in ('Account', 'Opportunity')
