public class ScheduleAccountUpdate implements Schedulable{
    public void execute (SchedulableContext sc){

        //execute batch 
    BatchAccountUpdate ba = new BatchAccountUpdate();
    database.executeBatch(ba, 50);

    
}
}

