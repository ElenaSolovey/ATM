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
        var atmId = component.get('v.atm.Id');
        var attribute = component.set("v.Id" , atmId);
        let createEvent = $A.get("e.c:atmEvent");
        createEvent.setParam({ "AtmId" : attribute});
        createEvent.fire();
        component.destroy();
    }
});