trigger UpdateRatingtrigger on AS3College__c (after update) {
    practice1.UpdateStatus(Trigger.new);

}