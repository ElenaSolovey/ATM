/**
 * Created by user on 16-Sep-19.
 */

({
    handlerATM: function(component, event, helper) {
        component.set("v.Id", event.getParam("AtmId"));
        component.set("v.flagSelectATM", true);
        console.log('xorosho');
    },

});