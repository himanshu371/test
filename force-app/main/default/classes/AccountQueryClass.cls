public class AccountQueryClass {
    
    public List<Account> getAccount(){
        List <Account> acc = new List <Account>();
        for (Account ac:[Select id,Name from account]){
            acc.add(ac);
        }
			return acc;        
    }

}