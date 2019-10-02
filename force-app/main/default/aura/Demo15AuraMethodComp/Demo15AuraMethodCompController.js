({
    doAction : function(component, event, helper) {
        var params = event.getParam("arguments");
        if(params) {
            var passedParam = params.param1; //param1 is the attribute name given in the component
            console.log("param value "+passedParam);
        }
    },
    handleClick : function(component, event, helper) {
        console.log("calling aura handleclick method");
        component.sampleMethod("1");
    }
})