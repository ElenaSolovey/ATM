({
    doInit : function(component, event, helper){
        helper.init(component);
    },
    openCard: function (component, event, helper) {
        console.log('Id ATM', component.get('v.atmId'));
        console.log('Id Card',event.getSource().get('v.value'));
        helper.openCard(component, event.getSource().get('v.value'));
    }
    // getATMInfo: function (component, event, helper) {
    //     helper.getATMInfo(component);
    // }
});