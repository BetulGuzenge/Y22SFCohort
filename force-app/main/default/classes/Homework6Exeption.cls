public class Homework6Exeption {
    public static void Abbreviated(string fullname) {

        try{
            if (!fullname.contains('')){
                system.debug('Fullname='+ fullname);
            }else{
                list<string> nameList = fullname.split(' ');
            
            string abbName= '';
            
            for( integer i=0 ; i < nameList.size()-1; i++){
                abbName+= nameList[i].substring(0,1).toUpperCase()+'.';
            }

            abbName+= nameList [nameList.size()-1];
            system.debug('Abbreviated Name=' + abbName);
        }
        }catch (NullPointerException NE) {
            system.debug('The value can not be null');
            system.debug(' message : ' + Ne.getMessage());

        } catch(Exception Ex){
            system.debug('something went wrong.');
            system.debug('message : ' + Ex.getMessage());
        }

    }

    public static void Homework7Ex(string value ){
        try{
            list<account > l1 = [ select id, Name, Industry from Account where Industry= :value ];
            system.debug (l1);
            
            string firstletterofindustry = value.substring(0) + ' .';
            system.debug (firstletterofindustry + l1[3]);


        }
        catch (NullPointerException ne) {
            
            system.debug(' NullPpointer Exeption Occured= '+ ne.getMessage());
        }
        catch (ListException Le){
            system.debug ('List Exception Occured='+ Le.getMessage());
        }
    }

    public static void Homework8(){

    try{

        Account acc1 = [ Select id, name from account where name='Salesforce' limit 1];

        list <Account> l1 = new List<account>();

        l1.add(acc1);
        system.debug (l1);
        }
        
        catch(NullPointerException npe){
            system.debug('CNull Pointer Acception Occured ');
            system.debug('error : ' + npe.getMessage());
 
        } 
        catch(DmlException de){
            system.debug('Dml exception occured');
            system.debug('Error: ' + de.getMessage());
        } 
        catch (QueryException qe ){
            system.debug('Query exception occured');
            system.debug('Error: ' + qe.getMessage());
        }
        catch (MathException me ){
            system.debug('Math exception occured');
            system.debug('Error: ' + me.getMessage());
        }

        catch (LimitException le){
            system.debug('Limit exception occured');
            system.debug('Error: ' + le.getMessage());
        }

        catch (ListException listex ){
            system.debug('Math exception occured');
            system.debug('Error: ' + listex.getMessage());
        }
                
        catch (Exception ex) {
            system.debug('Exception occurred.');
            system.debug('ex message: ' + ex.getMessage());
            
        }

        finally{
            system.debug ( 'End of code ');
        }

    }
}

