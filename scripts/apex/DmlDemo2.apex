DmlDemo2.studentjoiningdate();
DmlDemo2.dmlUpdate1();
DmlDemo2.dmlUpdate2();
DmlDemo2.assignment5();
DmlDemo2.dmlInsertMultipleRight();
DmlDemo2.examdetailinsert();

delete[select id from contact where firstname='Don'];
delete [select id from account where name='Jeff'];

list<contact> l1= [ select id from contact where firstname ='Don' all rows ];
undelete l1;

DmlDemo3.homework14();
