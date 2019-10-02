public class VFAssirgnmentController {
    public Contact selectedcontact{get; set;}
     public Id selectedContactId {get; set;}
    public Id selectedContactId1 {get; set;}
    id selctedId;
    public List<SelectOption> cagList{get; set;}
    public List<SelectOption> pdList{get; set;}
    public List<Contact> ContactList {get; set;}
     public List<Contact> ContactList1 {get; set;}
    public VFAssirgnmentController(){
        selectedcontact = new Contact();
       ContactList = new List<Contact>();
 ContactList1 = new List<Contact>();
        cagList = new List<SelectOption>();
         pdList = new List<SelectOption>();
       cagList.add(new SelectOption('None','---None--'));
        pdList.add(new SelectOption('None','---None--'));
        for(Product2 pc:[Select id,Family from Product2 ]){
            if(pc.Family !=null){
                cagList.add(new SelectOption(pc.id,pc.Family));
            selctedId=pc.Id;
                
            }
        }
        for(Product2 con :[SELECT name 
                           from Product2 
                           where id=:selctedId]){
                             pdList.add(new SelectOption(con.id,con.name));
                          }
        
    }
    public void showContactData(){
        for(Contact con :[SELECT id,Name,Phone
                          from Contact
                          where Phone !=null]){
                              ContactList1.add(con);
                              
                            ContactList.addAll(ContactList1);
                              //selectedcontact= con;
                          }
    }
    public void showProductData(){ 
    System.debug('the valu is '+selctedId);}
    
}