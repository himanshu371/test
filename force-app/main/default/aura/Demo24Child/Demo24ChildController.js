({
    childMethod : function(component, event, helper) {
        var params = event.getParam("arguments");
        if (params){
            var param1=params.param1;
            console.log("Parameter from Param"+param1);        }
    },
    callCompEvent : function(component, event, helper) {
        var compEvent= component.getEvent("childCmpEvent");
        var attributeData= component.get("v.chilData");
        compEvent.setParams({"data":attributeData});
        // compEvent.setParams({"data":component.get('v.childData')});
        compEvent.fire();
        
    }
})