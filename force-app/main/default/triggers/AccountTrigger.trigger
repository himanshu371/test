trigger AccountTrigger on Account (before insert,after insert) {
	//apex code written here
	//whenever sccount is created populate SLA expiration date = today + 90 days
	//Now we have done Before insert to after insert but it is not allowed as the scope of 
	//trigger.new(it becomes read only at after trigger) is till the save to do that we have added temporary variable here 
	//the value s stored in the list and whole new cycle will run at after trigger.....
	//before update is preffered beacause it will save one DML  
	/*List<Account> accountList=new List <Account>();
	for(Account acc:Trigger.new)
    {
        Account accTemp=new Account();
        accTemp.Id=acc.Id;
        accTemp.SLAExpirationDate__c= Date.today().addDays(90);
        accountList.add(accTemp);
    }
    if(accountList.size() > 0){
        update accountList;
    }*/
    //NEW Scenario//
    //whenever account is created, create a default opportunity associated to that account
   //opportunity name,should be accountName- opportunity and close date should be last date
   //of current year and stage = 'Closed lost'
  /* List<Opportunity> opportunityList = new List<Opportunity>();
    for(Account acc: Trigger.new){
        Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
        opp.Name = acc.Name + '-Opportunity';
        opp.StageName = 'Closed Lost';
        opp.CloseDate = date.newInstance(Date.today().year(), 12, 31);
        opportunityList.add(opp);
    }
    if(opportunityList.size() > 0){
        insert opportunityList;
    }*/
    //random usage of both//
     //code for SLA expiration date - scenario 1
    /*if(Trigger.isBefore){
        for(Account acc: Trigger.new){
            acc.SLAExpirationDate__c = Date.today().addDays(90);
        }
    }
     //code for Opportunity - scenario 2
    if(Trigger.isAfter){
        List<Opportunity> opportunityList = new List<Opportunity>();
        for(Account acc: Trigger.new){
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
    }*/
    //new Scenario2//
    //create a field favourite color(text(255) on user object)
   //create field a field favourite color(text(255) on account object) 
   //whenever account record is created populate favourite color on account based 
   //on account owner 
   //code for SLA expiration date - scenario 1
   /*
   if(Trigger.isBefore){ 
  Set<Id> ownerIdset=new Set <Id>();
    for(Account acc: Trigger.new)
   {
       ownerIdset.add(acc.OwnerId);
   }
    Map <Id,String> ownerIdtoColourMap=new Map <Id,String>();
    for (User user: [SELECT Id,	favourite_color__c
                    FROM User
                     WHERE Id IN: ownerIdset
                     AND favourite_color__c !=null])
    {
        ownerIdtoColourMap.put(user.Id, user.favourite_color__c);
    }
   for(Account acc: Trigger.new) {
            if(ownerIdtoColourMap.containsKey(acc.OwnerId)){
                acc.Favorite_Colour__c = ownerIdtoColourMap.get(acc.OwnerId);
            }
   		}
	}
*/
    /* if(Trigger.isBefore){
         
        AccountTrrigerHandler.populateExpirationDate(Trigger.new);
        AccountTrrigerHandler.CreateFavColour(Trigger.new);
    }
     if(Trigger.isAfter){
        AccountTrrigerHandler.CreateDefaultOpportunity(Trigger.new);
    }*/
   /* 
    //code for SLA expiration date - scenario 1
   //new Scenario
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTrrigerHandler.updateBillingToShipping(Trigger.new,Trigger.oldMap);
    }
    if(Trigger.isBefore && Trigger.isInsert){
        AccountTrrigerHandler.populateExpirationDate(Trigger.new);
        // scenario 3
        AccountTrrigerHandler.CreateFavColour(Trigger.new);
        
    	 AccountTrrigerHandler.copyBillingToShipping(Trigger.new);
    }
     //code for Opportunity - scenario 2
    if(Trigger.isAfter){
        if(Trigger.isInsert){
         AccountTrrigerHandler.CreateDefaultOpportunity(Trigger.new);
        }
        if (Constants.runAccountTrigger){
        AccountTrrigerHandler.recursiveTriggerDemo(Trigger.new);
            }
    	}
    

    
*/
    
    //code for SLA expiration date - scenario 1
    if(Trigger.isBefore && Trigger.isInsert){
        AccountTrrigerHandler.populateExpirationDate(Trigger.new);
        // scenario 3
        AccountTrrigerHandler.CreateFavColour(Trigger.new);
        //billing to shipping address
        AccountTrrigerHandler.copyBillingToShipping(Trigger.new);
    }
     //code for Opportunity - scenario 2
    if(Trigger.isAfter){
        if(Trigger.isInsert){
         AccountTrrigerHandler.createDefaultOpportunity(Trigger.new);
        }
        if(Constants.runAccountTrigger){
            AccountTrrigerHandler.recursiveTriggerDemo(Trigger.new);
        }   
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTrrigerHandler.updateBillingToShipping(Trigger.new,Trigger.oldMap);
    }
    
}