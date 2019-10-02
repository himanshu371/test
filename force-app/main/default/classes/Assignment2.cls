public class Assignment2 {
    public static void getOpp(){
        List <Account> acc12=new List <Account>();
        acc12=[select id from Account where Name='Express Logistics and Transport'];
        System.debug(acc12);
        List <Opportunity> acc1=new List <Opportunity>();
        acc1=[select id from Opportunity where account.id=:acc12];
        
      }
    
}