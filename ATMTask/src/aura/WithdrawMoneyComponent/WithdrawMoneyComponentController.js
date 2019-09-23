({
    doInit : function(component, event, helper){
        helper.init(component);
    },
    closePopup: function (component, event, helper) {
        helper.closePopup(component);
    },
    // isRefreshed: function(component, event, helper) {
    //         helper.init(component);
    // },
    withdrawMoney: function (component, event, helper) {
        let moneyATM = component.get("v.atm.AmountOfMoney__c");
        let commission = component.get("v.atm.Bank__r.Commission__c");
        console.log(commission);
        let amountToWithdraw = component.get("v.card.Amount_to_withdraw__c");
        if(amountToWithdraw < 0){

        }else {
            console.log(amountToWithdraw);
            let atmBank = component.get("v.atm.Bank__c");
            console.log(atmBank);
            let cardBank = component.get("v.card.Bank__c");
            console.log(cardBank);
            let finalSum;
            if (atmBank === cardBank) {
                finalSum = parseFloat(amountToWithdraw);
                console.log(finalSum);
            } else {
                finalSum = (parseFloat(amountToWithdraw) + (parseFloat(amountToWithdraw) * (commission * 0.01)));
                console.log(finalSum);
            }
            if (moneyATM <= finalSum) {
                alert("Sorry, but there is not enough money in the ATM");
            } else {
                helper.withdrawMoney(component, finalSum);
            }
        }
    }
});