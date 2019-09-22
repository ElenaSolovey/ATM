({
    doInit : function(component, event, helper){
        helper.init(component);
    },
    openCard: function (component, event, helper) {
        console.log('Id Card',event.getSource().get('v.value'));
        helper.openCard(component, event.getSource().get('v.value'));
    },
    back : function (component, event, helper) {
        helper.back(component);
    }
});