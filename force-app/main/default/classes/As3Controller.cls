public class As3Controller {
    
    public AS3College__c CollegeRec{get;set;}
     public List<AS3College__c> CollegeList{get;set;} 
    @AuraEnabled
    public static List<AS3College__c> getTheRecord(String recordId){
        List<AS3College__c> AS3CollegeInit = new List<AS3College__c>();
        AS3CollegeInit=[Select id, Name from AS3College__c where id =:recordId ];
        return AS3CollegeInit;
        
    }
    @AuraEnabled
    public static List<Contact> getContactsList(string ContactIds){
        List<Contact> Contactslist = new List<Contact>();
        Contactslist=[Select id, Name from Contact where id =:ContactIds];
        return Contactslist;
        
    }
    
    

}