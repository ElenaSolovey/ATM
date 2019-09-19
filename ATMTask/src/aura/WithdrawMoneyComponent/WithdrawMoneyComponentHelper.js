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
    withdrawMoney: function (component, finalSum) {
        let idCard = component.get("v.CardId");
        console.log(idCard);
        let action = component.get("c.minusCard");
        action.setParams({
            idCard : idCard,
            finalSum: finalSum,
            idATM: component.get("v.atm.Id")
        });
        action.setCallback(this, function (response) {
           let state = response.getState();
            console.log(state);
           if(state === "SUCCESS"){
               if(response.getReturnValue() == "null"){
                   alert("You have not entered the amount!")
               } else if(response.getReturnValue() === "yes"){
                   alert('Take your money!');
               }else if(response.getReturnValue() === "credit"){
                   alert("Take your money!");
               } else if (response.getReturnValue() === "debit"){
                   alert("Not enough money on the card !");
               } else if(response.getReturnValue() === "null" || response.getReturnValue() == null){
                   alert("Not enough money on the card with credit opportunity!");
               }
               console.log(response.getReturnValue());
           } else if( state === "ERROR"){
               alert("Not enough money on the card ");
               console.log(response.getReturnValue());
           }
        });
        $A.enqueueAction(action);
    }
});