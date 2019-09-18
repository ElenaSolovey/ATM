({
    doInit : function(component, event, helper){
        helper.init(component);
    },
    openCard: function (component, event, helper) {
        // console.log('ATM', component.get('v.atm'));
        console.log('Id Card',event.getSource().get('v.value'));
        helper.openCard(component, event.getSource().get('v.value'));
    }
    // getATMInfo: function (component, event, helper) {
    //     helper.getATMInfo(component);
    // }
});