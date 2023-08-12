public class updateAccRating {
   
   public static void updateaccountraiting(){

   list <account> updatedacc = [ select id , rating from account where rating = null];
    for(account eachacc : updatedacc){

        eachacc.rating = 'warm';
        eachacc.Industry='Agriculture';
        

   }

   update updatedacc;

   

   
}
}