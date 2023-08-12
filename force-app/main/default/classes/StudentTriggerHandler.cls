public class StudentTriggerHandler {
    public static void Checkexmandetail(List<Student__c> StuTriggerOld) {

        list <Student__c> allStudent = StuTriggerOld;

        set <Id> relatedExamDetail= new set<Id>();
        for (Student__c eachst : allStudent){
            relatedExamDetail.add(eachst.Id);

        }

       List<Exam_Detail__c> l1 = [ Select id from Exam_Detail__c where Student__c IN: RelatedExamDetail];
       if (! l1.isEmpty()){
        for (Student__c eachstu :StuTriggerOld){
           eachstu.addError ('This Student record is related to an exam detail. Can not be deleted ');
            
        }
       }

    }
}