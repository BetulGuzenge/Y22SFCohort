public class EnumUseCase {
    public void createExams (string name , Assignment1enum.Weekday examday) {

        Exam_Detail__c ed= new Exam_Detail__c();
        ed.Name = name ; 
        ed.Day = examday.name();// here there is no field as day . just to have an idea about enum . 

        insert ed; 

    }
}