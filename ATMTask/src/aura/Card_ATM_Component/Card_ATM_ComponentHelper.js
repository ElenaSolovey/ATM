({
    init : function(component, event, helper) {
        // let accId = component.get("v.accountId");
        let action = component.get("c.getCardList");
        // action.setParam({accountId : accId});
        action.setCallback(this, function (response) {
            component.set("v.cards", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
});