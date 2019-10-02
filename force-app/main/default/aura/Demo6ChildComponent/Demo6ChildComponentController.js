({
 updateChildAttr : function(component, event, helper) {
  component.set("v.childAttr","Child Value from Child comp");
 },
    onChildAttrChange : function(component, event, helper) {
        console.log("child attr changed");
        console.log("old value "+event.getParam("oldValue"));
        console.log("new value "+event.getParam("value"));
    }
})