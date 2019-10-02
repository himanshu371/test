({
	handleClick : function(component, event, helper) {
		var toggleText = component.find("text");
        $A.util.addClass(toggleText,"toggleClass");
	}
})