trigger ContactTrigger1 on Contact (before insert) {

    ContactTriggerHandler.preventDuplicateContact(trigger.new);
    
}