public class practice1 {
    /*1. Update operation to update status 
of Invoice to ‘Paid’ created today and having status other than ‘Paid’.
*/
    //In account object update custom links where rating is null
    public static void UpdateStatus(List <AS3College__c> trigger1){
       list <AS3College__c> updateList=new list <AS3College__c>();
        for(AS3College__c acc:[select id from AS3College__c]){
            if (acc.CollegeFees__c==null)
            {
                acc.CollegeFees__c=300;
                updateList.add(acc);
            }
        }
        update updateList;
        
        
        
    }

}