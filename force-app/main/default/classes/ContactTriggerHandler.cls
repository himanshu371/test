public class ContactTriggerHandler {
    /*prevent duplicate contacts and if we update any contact then also
   * we should prevent duplication
   *uniqueContact = FirstName+lastName+email+dob
   */

    public static void preventDuplicateContact(List<Contact> newList){
        Set<String> firstNameSet = new Set<String>();
        Set<String> lastNameSet = new Set<String>();
        Set<String> emailSet = new Set<String>();
        Set<Date> birthdateSet = new Set<Date>();
        
        Set<String>  uniqueStringSet= new Set<String>();
        for(Contact c: newList){
            firstNameSet.add(c.FirstName);
            lastNameSet.add(c.LastName);
            emailSet.add(c.Email);
            birthdateSet.add(c.Birthdate);
        }

        for(Contact c: [SELECT FirstName,LastName,Email,BirthDate
                        FROM Contact
                        WHERE FirstName IN: firstNameSet
                        AND LastName IN: lastNameSet
                        AND Email IN: emailSet
                        AND BirthDate IN: birthdateSet]){
                            
            String uniqueString = c.FirstName + c.LastName + c.Email + c.Birthdate;
            uniqueStringSet.add(uniqueString);                
        }
        for(Contact c: newList){
            String uniqueString = c.FirstName + c.LastName + c.Email + c.Birthdate;
            if(uniqueStringSet.contains(uniqueString)){
                //hard coded labels
                //c.addError('Duplicate contacts are not allowed');
                //labels can be chaged trough org. So we have done there. 	
                c.addError(System.label.Contacttrigger1_Error);
            }
        }               
    }

}