public class VFDemo4Extension {
    String RecordTypeId;
    String rtAdded;
    public VFDemo4Extension(ApexPages.StandardController stdController){
        RecordTypeId=apexpages.currentPage().getparameters().get('RecordType');
        rtAdded=apexpages.currentPage().getparameters().get('rtAdded');
    }
   public PageReference checkRecordType(){
     Id phoneRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('phone').getRecordTypeId();
     Id tvRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('TV').getRecordTypeId();
        PageReference ref;
        if(phoneRecordTypeId == recordTypeId && rtAdded == null){
            ref = new PageReference('/apex/VFDemo4?rtAdded=true&recordtypeId='+recordTypeId);
        }
        if(phoneRecordTypeId == recordTypeId && rtAdded != null){
            return null;
        }
        if(recordTypeId == tvRecordTypeId){
             ref = new PageReference('/apex/VFDemo4_2?recordtypeId='+recordTypeId);
        }
       ref.setRedirect(true);
        return ref;
    }

}