({
 updateParentAttr : function(component, event, helper) {
  console.log("Bounded parent attribute updated");
        component.set("v.parentAttr","bounded parent value updated");
 },
    onParentAttrChange : function(component, event, helper) {
        console.log("bounded parent attr changed");
        console.log("old value before event"+event.getParam("oldValue"));
        console.log("new value after event"+event.getParam("value"));
    }
})