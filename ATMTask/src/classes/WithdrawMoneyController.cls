/**
 * Created by user on 16-Sep-19.
 */

public with sharing class WithdrawMoneyController {
    @AuraEnabled
    public static Card__c getCardById(String cardId) {
        return [
                SELECT
                        Id,
                        Name,
                        Bank__r.Name,
                        Cash__c,
                        Type__c
                FROM    Card__c
                WHERE   Id =: cardId
        ];
    }
}