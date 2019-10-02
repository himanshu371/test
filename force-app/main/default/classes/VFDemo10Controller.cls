//creating custom page to get errors if some conditions are not met

public class VFDemo10Controller {

    public Account acc{get; set;}
    Id accId;
    public VFDemo10Controller(){
        acc = new Account();
        accId = apexpages.currentPage().getParameters().get('recId');
        if(accId != null){
            for(Account a :[SELECT Name,Rating
                            FROM Account
                            WHERE Id = :accId]){
                acc = a;
            }
        }
    }
    public void save(){
        boolean isErrorOccured = false;
        if(acc.rating == null || acc.Rating == '')
        {
            String error = 'Rating is required to create an Account';
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,error);
            ApexPages.addMessage(myMsg);
            isErrorOccured = true;
        }
        if(!isErrorOccured)
        {
        upsert acc;
        }
        
    }
    public PageReference cancel(){
        PageReference ref = new PageReference('/001/o');
        return ref;
    }
}