public class Assignment1enum {
    public enum Weekday  {MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY}

    public enum Weekend {SATURDAY, SUNDAY}

    public void show (Weekday inn , Weekend out ){
        system.debug ('enum weekday value is: '+ inn);
        system.debug ('enum weekend value is ' + out); 

        integer innOrdrinal = inn.ordinal();
        system.debug ('weekday ordrinal : ' + innOrdrinal);
        integer outOrdrinal = out.ordinal();
        system.debug ('weekend ordrinal : ' + outOrdrinal);

        system.debug('weekday enum values : ' + weekday.values());
        system.debug ('weekend enum values : ' + weekend.values());
    }
}