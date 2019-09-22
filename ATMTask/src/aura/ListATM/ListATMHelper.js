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
        var createEvent = $A.get("e.c:AtmEvent");
        createEvent.setParams({ "atm" : atm});
        createEvent.fire();
        component.destroy();
    }
});