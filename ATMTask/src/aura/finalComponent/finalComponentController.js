/**
 * Created by user on 16-Sep-19.
 */

({
    handlerATM: function(component, event, helper) {
        component.set("v.atm", event.getParam("atm"));
        component.set("v.comp2", true);
        component.set("v.comp1", false);
        // console.log('Id ATM перед переходе на вторую',event.getParam("AtmId"));
        console.log(event.getParam("atm"));
    },
    handlerBack : function (component) {
        component.set("v.comp2", false);
        component.set("v.comp1", true);
    }

});