/**
 * Created by user on 15-Sep-19.
 */

({
    doInit : function(component, event, helper){
        helper.init(component);
    },
    withdrawMoney : function (component, event, helper) {
        var atm = event.getSource().get('v.value.Id');
        console.log('atm', atm);
        if (atm) {
            helper.withdrawMoney(component, atm);
        }
    },

});