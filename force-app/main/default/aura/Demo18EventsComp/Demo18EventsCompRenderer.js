({
    render : function(cmp, helper) {
        var ret = this.superRender();
         console.log("render method called");
        return ret;
    },
    rerender : function(cmp, helper){
        this.superRerender();
         console.log("rerender method called");
    },
    afterRender: function (component, helper) {
        this.superAfterRender();
         console.log("after-render method called");
    }
})