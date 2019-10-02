({
 doInit : function(component, event, helper) {
        var data = {'name':'test name', 'email':'test@test.com'};
        component.set("v.jsObject",data);
     component.set("v.userData",{
          'myString':'test value'
     });
 }
})