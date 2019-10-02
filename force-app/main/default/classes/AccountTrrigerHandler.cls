public class AccountTrrigerHandler {
    //adding addition comments
    
    public static void populateExpirationDate(List<Account> newList )
    {
        for(Account acc: newList){
            acc.SLAExpirationDate__c = Date.today().addDays(90);
        }
    }
    
    public static void CreateDefaultOpportunity(List<Account> newList){
    
        List<Opportunity> opportunityList = new List<Opportunity>();
        for(Account acc: newList){
        Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = acc.Name + '-Opportunity';
            opp.StageName = 'Closed Lost';
            opp.CloseDate = date.newInstance(Date.today().year(), 12, 31);
            opportunityList.add(opp);
        }
        if(opportunityList.size() > 0){
            insert opportunityList;
        }
    }
    
	
    public static void CreateFavColour(List<Account> newList){ 
              Set<Id> ownerIdset=new Set <Id>();
                for(Account acc: newList)
               {
                   ownerIdset.add(acc.OwnerId);
               }
                Map <Id,String> ownerIdtoColourMap=new Map <Id,String>();
                for (User user: [SELECT Id,	favourite_color__c
                                FROM User
                                 WHERE Id IN: ownerIdset
                                 AND favourite_color__c !=null]){
                    ownerIdtoColourMap.put(user.Id, user.favourite_color__c);
                }
               for(Account acc: newList) {
                        if(ownerIdtoColourMap.containsKey(acc.OwnerId)){
                            acc.Favorite_Colour__c = ownerIdtoColourMap.get(acc.OwnerId);
                        }
                    }
                }
    
    public static void recursiveTriggerDemo(List<Account> newList){
        
        List<Account> accountList = new List<Account>();
        for(Account acc: newList){
   Account a = new Account();
            if(acc.SLAExpirationDate__c == null){
                acc.SLAExpirationDate__c = date.today();
            }
            a.Id = acc.Id;
            a.SLAExpirationDate__c = acc.SLAExpirationDate__c.addDays(90);
            accountList.add(a);
        }
        if(accountList.size() > 0){
            Constants.runAccountTrigger = false;
            update accountList;
        }
    }
    /*
on updation 
   1. if check is updated to true from false copy data from Billing to shipping. 
   2. if check box is true to false delete shipping address.
   3. deleting/updating billing address and true copy billing in shipping.
   4. user updating checkbox true to false and updating shipping address then do nothing. 
   5. If we are updating any other fields other than shipping address, billing address and the checkbox then trigger should not be called.
*/
    public static void copyBillingToShipping(List<Account> newList) {
        
        for(Account a: newList){
            if(a.CopyBillingAdresstoShipping_Adddress__c){
                a.ShippingStreet = a.BillingStreet;
                 a.ShippingCity = a.BillingCity;
                a.ShippingState  = a.BillingState;
                   a.ShippingPostalCode = a.BillingPostalCode;
                   a.ShippingCountry = a.BillingCountry;
            }
        }
    }
    public static void updateBillingToShipping(List<Account> newList,Map<Id,Account> oldMap)
    {
        for(Account acc: newList){
            if(acc.CopyBillingAdresstoShipping_Adddress__c != 
   oldMap.get(acc.Id).CopyBillingAdresstoShipping_Adddress__c
              ){
   if(!acc.CopyBillingAdresstoShipping_Adddress__c){
    acc.ShippingStreet = null;
                acc.ShippingCity = null;
                acc.ShippingState  = null;
                acc.ShippingPostalCode = null;
                acc.ShippingCountry = null;
    }
            else {
                acc.ShippingStreet = acc.BillingStreet;
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingState  = acc.BillingState;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingCountry = acc.BillingCountry;
            }
        }
    }
    
}
}