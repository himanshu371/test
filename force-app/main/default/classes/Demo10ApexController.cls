public class Demo10ApexController {
    @auraEnabled
    public static List<Account> getAccount(){
        List <Account> accList=[Select Id, Name from Account limit 10];
        return accList;
    }
      @auraEnabled
    public static List<Contact> fetchContacts(String selectaccountId){
        return  [SELECT 
                FirstName,LastName,Birthdate,Email 
                FROM Contact 
                Where AccountId =:selectaccountId];
    }

}