({
 update : function (component, event, helper) {
        // Get the new hash from the event
        var loc = event.getParam("token");
        if(loc != undefined) {
            var tabComponent = component.find("tabid");
            tabComponent.forEach(function(item,index){
                if($A.util.hasClass(item, loc)) {
                    $A.util.addClass(item, "slds-is-active");
                }else {
                   $A.util.removeClass(item, "slds-is-active"); 
                }
            });
            var tabContent = component.find("tabcontentid");
            tabContent.forEach(function(item,index){
                if($A.util.hasClass(item, loc)) {
                    $A.util.addClass(item, "slds-show");
                    $A.util.removeClass(item, "slds-hide");
                }else {
                   $A.util.removeClass(item, "slds-show");
                   $A.util.addClass(item, "slds-hide");
                }
            });
        }

 }
})