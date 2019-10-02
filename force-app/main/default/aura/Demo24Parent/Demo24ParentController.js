({
    callChildMethod : function(component, event, helper) {
        var childComp= component.find("child");
        childComp.childMethod("parameter to child");
    },
    handelComp : function(component, event, helper) {
        var data = event.getParam("data");
        component.set("v.dataFromChild",data);
    }
    
})