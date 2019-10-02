({
    doInIt : function(component, event, helper) {
        console.log("init event called for "+component.getName());
    },
    onRender : function(component, event, helper) {
        console.log("render event called for "+component.getName());
    },
    update : function (component, event, helper) {
        // Get the new hash from the event
        var loc = event.getParam("token");
        console.log("Location: "+loc);
    }
    
})