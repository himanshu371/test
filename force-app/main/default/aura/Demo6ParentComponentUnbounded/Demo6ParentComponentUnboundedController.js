({
 updateParentAttr : function(component, event, helper) {
  console.log("UnBounded parent attribute updated");
        component.set("v.parentAttr","Unbounded parent value updated");
 },
    onParentAttrChange : function(component, event, helper) {
        console.log("Unbounded parent attr changed");
        console.log("old value before event"+event.getParam("oldValue"));
        console.log("new value after event"+event.getParam("value"));
    }
})