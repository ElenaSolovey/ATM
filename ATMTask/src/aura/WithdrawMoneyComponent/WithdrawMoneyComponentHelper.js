({
    init : function(component, event, helper) {
        let action = component.get("c.getCardById");
        let cardId = component.get("v.CardId");
        console.log(cardId);
        action.setParams({
            cardId: cardId
        });
        action.setCallback(this, function (response) {
            component.set("v.card", response.getReturnValue());
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
});