public class VFDemo5Controller {
    
    public Account acc{get; set;}
    ID accID;
    public VFDemo5Controller(){
        acc = new Account();
        accID=apexpages.currentPage().getParameters().get('recID');
        if(accID !=null){
            for(Account a:[SELECT Name,Rating
                          FROM Account
                          where ID= :accID])
                acc=a;
        }
    }
    public PageReference  save(){
        upsert acc;
          PageReference ref = new PageReference('/'+acc.Id);
        return ref;
    }
    public PageReference cancel(){
        PageReference ref=new PageReference('001/o');
        return ref;
    }
}