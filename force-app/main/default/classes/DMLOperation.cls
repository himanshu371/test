public class DMLOperation {
    public void readRecord(){
        List<Account> accountList = new List<Account> ();
        accountList  = [SELECT ID,NAME,
                       Active__c
                       FROM Account
                       WHERE Name !=null
                       Limit 10];
        for(Account acc:accountList)
        {
            System.debug(acc.Name+' '+acc.Id);
        }
    }

}