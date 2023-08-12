schema.SobjectType acc= schema.getGlobalDescribe().get('Account');
Schema.DescribeFieldResult ratingFR= Account.rating.getDescribe();
list<schema.PicklistEntry> allRatingValues = ratingFR.getPicklistValues();
system.debug(allRatingValues);


for (schema.PicklistEntry eachentry: allRatingValues){
    system.debug (eachentry.getlabel()+ '---->'+ eachentry.getValue());
}