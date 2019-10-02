public class VFDemo7Controller {
    
    public Account acc{get; set;}
    Id accId;
    public boolean showEdit{get; set;}
    public VFDemo7Controller(){
        acc = new Account();
        accId = apexpages.currentPage().getParameters().get('recId');
        if(accId != null){
            for(Account a :[SELECT Name,Rating
                            FROM Account
                            WHERE Id = :accId]){
                                acc = a;
                            }
        }
        if(accId != null){
            showEdit=false;
        }
        else{
            showEdit=true;
        }
    }
    public void save(){
        upsert acc;
        showEdit = false;
    }

     public void Edit(){
        showEdit=true;
    }
    public PageReference cancel(){
        PageReference ref = new PageReference('/001/o');
        return ref;
    }
}