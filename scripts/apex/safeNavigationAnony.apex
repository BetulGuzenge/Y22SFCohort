public class EnumUseCase {
    public void createExams (string name , Assignment1enum.Weekday examday) {

        Exam_Detail__c ed= new Exam_Detail__c();
        ed.Name = name?.toUpperCase(); // Here user enter an examname. if we want to write our code to accept onlu uppercase and if user does not pass any parametre here than system will break.
                                        // Safe Navigation Operator helps here which is only Question mark (? )
                                        // ? means ==> If it is not null do not worry about . No give error. If it is suitable value go head
        ed.Day = examday.name();// here there is no field as day . just to have an idea about enum . 

        insert ed; 
    }

list<account> listAcc =[select id ,name from account where name like '%yoll%'];// with list we can not applu safenavigation but we can apply it to a particular field 
for (Account acc : listAcc){
    if(acc.Description?.contains ('yoll')){
        system.debug('description contains yoll')
    }
}

//  we can not use safe navigation operation while we are assigning a value 
    // ex: acc?.description='some value';===> this is can not be use . We can use it while getting the value . 

    // whenever we want to be sure that the value is not null , we can use it 


    }

    string checkName='yoll'; //SOQL bind expressions.
    id accountId = [select id, name decription from account where name =:checkname]?.id;// in this way even if the value is null our program won't braek . 


    public static void getContactId(string name ){
        id contactId = [select id , name from contact where name =:name limit 1]?.id;
        system.debug (contactId) ; 
    }

   