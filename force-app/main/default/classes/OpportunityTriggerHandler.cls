public class OpportunityTriggerHandler {
    public static void updateNumberOfOppsInAcc(List<opportunity> oppTrigerNew, Map<id,Opportunity> OppTriggerNewMap) {
        
        //get all acc ids for which we want to update count of opp. To store that ids create set <id>
        set<id> accIds=new set<id>();
        
        for (Opportunity newOp: oppTrigerNew){

            if( newOp.AccountId != null){
                accIds.add(newOp.AccountId);//add accountid NOT opp.id
            }

        }

        if(!accIds.isEmpty()){

            //how to get count of opps for each Account==>BELOW there are two ways
            //1st
            list<account> listAcc = [select id, name ,(select id from Opportunities)from account where id in :accIds];

            for (Account acc: listAcc){
                integer countOpp = acc.Opportunities.size();// acc.opportunities is a list
                acc.Number_of_Opportunities__c= countOpp;
            }
            update listAcc;
        }  

    }
    public static void IfAccnamechangeupdatenumofopp (List<opportunity> oppTrigerNew, Map<id,Opportunity> OppTriggerNewMap,List<Opportunity> oppTriggerNew , Map<Id,Opportunity> oppTriggerOldMap){
        set<id> accIds=new set<id>();
        set<id> accids2 =new set <id>();
        for(Opportunity newopp : oppTrigerNew){
            Opportunity oldopp = oppTriggerOldMap.get(newopp.Id);
            if(oldopp.AccountId!=null){
            if(oldopp.AccountId != newopp.AccountId){
                accIds.add(newopp.AccountId);
                accids2.add (oldopp.AccountId);
            }
             }else 
                {accIds.add(newopp.AccountId);
             }
        }

        if(!accIds.isEmpty()){
            list<account> listAcc =[select id ,name,Number_of_Opportunities__c,(select id from Opportunities) from account where id in : accids];
            for (account eachacc :listAcc){
                integer countopp = eachacc.Opportunities.size ();
                eachacc.Number_of_Opportunities__c = countopp ;
            }
            try{
            update listAcc;
            }
            catch (Exception ex){
            system.debug(ex.getMessage());
            }
        }

        if (!accids2.isEmpty()){
            list<account> listacc2 = [select id ,name,Number_of_Opportunities__c,(select id from Opportunities)  from account where id in : accids2];
            for (account eachacc: listacc2){
                integer countopp = eachacc.Opportunities.size ();
                eachacc.Number_of_Opportunities__c = countopp ;
            }
            try{
                update listacc2;
                }
                catch (Exception ex){
                system.debug(ex.getMessage());
                }
        }
    }

    
}