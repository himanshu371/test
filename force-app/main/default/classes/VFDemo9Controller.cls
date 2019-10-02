public class VFDemo9Controller {
    public list<SelectOption> appList{get; set;}
    public Id selectedAccountId {get; set;}
    public Account selectedAccount{get; set;}
    public List<Contact> relateContactList {get; set;}
     public Id selectedContactId {get; set;}
    public contact selectedcontact{get; set;}
    public VFDemo9Controller(){
        //relateContactList.clear();
        relateContactList = new List<Contact>();
        selectedAccount =new Account();
        selectedcontact =new Contact();
        appList = new List <SelectOption>();
        appList.add(new SelectOption('','None'));
        for(Account acc: [Select id, Name
                          from Account
                          Limit 10]){
                              appList.add(new SelectOption(acc.id, acc.name));
                              
                          }
    }
    public void showAccountData(){
        for(Account acc: [SELECT Id,Name,OwnerId,Active__c, (Select id,firstName,LastName,BirthDate,Email 
                                                           from  Contacts)
                          FROM Account
                          WHERE Id =:selectedAccountId]){
                              selectedAccount = acc;
                              relateContactList.addall(acc.Contacts);
                              ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Data Displayed'));
                          }
        
        if (selectedAccountId==null)
        {
            selectedAccount =new Account();
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Select Account to  Display Data'));
        }
    }
    public void fetchContactRecord(){
        for(Contact con: [select id,FirstName,LastName,BirthDate,Email
                         From Contact
                          where id=:selectedContactId]){
                               selectedContact = con;
                          }
    }
    public void save(){
        update selectedContact;
        selectedContact =new Contact();
        showAccountData(); //to refresh
    }
    public void showWarning(){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Warning,'Please Save the UnSaved Changes!'));
    }
    
}