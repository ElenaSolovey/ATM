public with sharing class Card_ATM_Controller {
    @AuraEnabled
    public static List<Card__c> getCardList() {
        List<Card__c> cards = [
                               SELECT Id,
                                      Name ,
                                      Bank__r.Name,
                                      Cash__c
                               FROM   Card__c
        ];
        return cards;
    }
}