List<contact> allContacts = [select id, name, phone from contact where phone != null];
ContactUpdateQueueable cq = new ContactUpdateQueueable(allContacts);
system.enqueueJob(cq);

//new instance calls constructor , constructor assign that list to class variable , class variable is used for execute method 