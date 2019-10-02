public class UpdateAccountRecords {

    public void updateAccount() {
        List<Account> accountUpdateList = new List<Account>();
        for(Contact con:[	SELECT Id,account.Id 
             				From Contact
                			WHERE Name 
                         	LIKE '%Test%'
                         	AND account.Id != NULL]){
                         Account acc = new Account();    
                         acc.Id = con.account.Id;
                         accountUpdateList.add(acc);
                         }
        if(accountUpdateList.size() > 0) {
            
            update accountUpdateList;
        }
    }
}