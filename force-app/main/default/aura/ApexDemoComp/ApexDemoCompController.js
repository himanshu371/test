({
    doinit : function(component, event, helper) {
        var action = component.get("c.getAccount");
        action.setCallback(this,function(response){
            var status = response.getState();
            if(status === 'SUCCESS'){
                component.set("v.accList",response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
    },
    getContacts: function(component, event, helper) {
    var action = component.get("c.fetchContacts");
    var recordId = component.get("v.selectaccountId");
    action.setParams({'selectaccountId':recordId});
    action.setCallback(this,function(response){
    var status = response.getState();
    if(status === 'SUCCESS'){
        component.set("v.contactList",response.getReturnValue());
        
    } 
});
      if(recordId != ''){
         $A.enqueueAction(action);
        }
}
})