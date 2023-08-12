public class SchedualableTraining implements Schedulable {
    public void execute (SchedulableContext sc ){

        QueueableTraining qt = new QueueableTraining();

        id queueId = system.enqueueJob(qt);
        system.debug('queueable job id is' + queueId);

    }
}