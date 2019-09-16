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
    @AuraEnabled
    public static Cash_Machine__c getATMById(String atmId) {
        return [
                SELECT
                        Id,
                        Name,
                        Bank__r.Name,
                        AmountOfMoney__c
                FROM    Cash_Machine__c
                WHERE   Id =: atmId
        ];
    }
}