public class UpdateShipping2billing {
    
    
     public void findDuplicateContacts() {
        
        Set<String> firstNameSet = new Set<String>();
        Set<String> lastNameSet = new Set<String>();
        Set<String> emailSet = new Set<String>();
        Set<Date> birthdateSet = new Set<Date>();
        
        Map<String,Set<Id>> duplicateMap = new Map<String,Set<Id>>();
        
       for(Contact c : [SELECT Id,FirstName,LastName,Email,BirthDate
                        FROM Contact
                        WHERE createdDate = LAST_N_DAYS:15])
       {
           firstNameSet.add(c.FirstName);
           lastNameSet.add(c.LastName);
           emailSet.add(c.Email);
           birthdateSet.add(c.Birthdate);
           
       }
       for(Contact c : [SELECT Id,FirstName,LastName,Email,BirthDate
                        FROM Contact
                        WHERE FirstName IN: firstNameSet
                        AND LastName IN: lastNameSet
                        AND Email IN: emailSet
                        AND BirthDate IN: birthdateSet]){
           String key = c.FirstName +c.LastName+c.Email+String.valueOf(c.Birthdate);
           if(!duplicateMap.containsKey(key)){
               duplicateMap.put(key,new Set<Id>());
           } 
           duplicateMap.get(key).add(c.Id);
       }
        List<Contact> contactUpdateList = new List<Contact>();
        for(String key: duplicateMap.keySet())
        {
            if(duplicateMap.get(key).size() > 1){
                for(Id contactId: duplicateMap.get(key)){
                    Contact con = new Contact();
                    con.Id = contactId;
                    con.Duplicate_Contact__c = true;
                 contactUpdateList.add(con);
                }
            }
            
        }
        if(contactUpdateList.size()>0){
            update contactUpdateList;
        }
    }
    


}