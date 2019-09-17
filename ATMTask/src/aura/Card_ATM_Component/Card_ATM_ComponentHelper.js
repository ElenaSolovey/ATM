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
        $A.createComponent(
            "c:WithdrawMoneyComponent",
            {
                'CardId' : cardId
                // 'ATMId' : component.get("v.atmId")
            },
            function(newComponent, status, errorMessage){
                console.log('status:', status);
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
    }
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