({
    init : function(component, event, helper) {
        let action = component.get("c.getCardList");
        action.setCallback(this, function (response) {
            component.set("v.cards", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    openCard: function (component, cardId) {
        console.log(cardId);
        console.log(JSON.stringify(component.get("v.atm")));
        $A.createComponent(
            "c:WithdrawMoneyComponent",
            {
                'CardId' : cardId,
                'atm' : component.get("v.atm")
            },
            function(newComponent, status, errorMessage){
                console.log("status:", status);
                if (status === "SUCCESS") {
                    var body = component.find("WithdrawMoneyComponent");
                    body.set("v.body", newComponent);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                }
            }
        );
    },
    back : function(component, event, helper){
        let visible = true;
        let createEvent = $A.get("e.c:BackEvent");
        createEvent.setParams({ "visible" : visible});
        createEvent.fire();
        component.destroy();
    }
});