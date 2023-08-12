public class EnumExample {
    //Season is Enum Datatype
    public enum Season {WINTER, SUMMER, SPRING, FALL}//write always capital. not mandotary but best and general practice 

    //show is the method name
        //it accepts 1 parameter. Parameters datatype is Season (which is enum datatype)
    public void show(Season s){//It accepts only one parameters  
        system.debug('enum season value: ' + s);

        system.debug ('enum season value:' + s);
        
        system.debug ('season enum values : ' + season.values()) ;
        string sName = s.name();
        SYSTEM.DEBUG ('S NAME==> '+ sName);
        // string s1=s; ==> we can not assign it directly to value. this doesn't work. We must use NAME 

        system.debug ('s name ==> '+s.name());

        integer sOrdrinal =s.ordinal();
        system.debug('s ordrinal ==> ' + sOrdrinal);
        


        switch on s {
            when WINTER {
                system.debug('season is winter. its cold.');
            }
            when SUMMER {
                system.debug('season is summer. its hot.');
            }
            when SPRING {
                system.debug('season is spring. its warm and nice and great.');
            }
            when FALL{
                system.debug('season is fall. its colorful');
            }
            when else {
                system.debug('eow.');
            }
        }
    }
    public void show (list<season> s){
        system.debug(s);
    }
}