({  doInit : function(component, event, helper){
        helper.init(component);
    },
    closePopup: function (component, event, helper) {
        component.destroy();
    }
});