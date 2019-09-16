({
    init : function(component, event, helper) {
        let action = component.get("c.getCardList");
        action.setCallback(this, function (response) {
            component.set("v.cards", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    // getATMInfo : function (component, event, helper) {
    //     let action = component.get("c.getATMById");
    //     let atmId = component.get("v.atmId");
    //     action.setParams({
    //         atmId: atmId
    //     });
    //     action.setCallback(this, function (response) {
    //         action.set({"v.atm": response.getReturnValue()})
    //     });
    //     $A.enqueueAction(action);
    // }
});