public class VFDemo6Controller {
    
    public boolean showPanel{get; set;}
    public list<account> accList{get;set;}
    
    public VFDemo6Controller(){
        showPanel = false;
        accList = new List<Account>([select id,name,AccountNumber,ownerId
                                     from account
                                     limit 10]);
    }
    
    public void save(){
        
    }
    public void cancel() {
        
    }
    
}