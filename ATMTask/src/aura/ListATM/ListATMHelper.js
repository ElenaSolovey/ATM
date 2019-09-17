/**
 * Created by user on 15-Sep-19.
 */

({
    init : function(component, event, helper) {
        var action = component.get("c.getAtmList");
        action.setCallback(this, function (response) {
            component.set("v.listATM", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    withdrawMoney: function (component, atm) {
        console.log('atm', atm);
        let createEvent = $A.get("e.c:AtmEvent");
        createEvent.setParams({ "AtmId" : atm});
        createEvent.fire();
        component.destroy();
    }
});