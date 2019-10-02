({
	fireAppEvent : function(component, event, helper) {
        var appEvent = $A.get("e.c:Demo20ApplicationEvent");
        appEvent.setParams({"message":"value Event App Notifier"});
        appEvent.fire();
	}
})