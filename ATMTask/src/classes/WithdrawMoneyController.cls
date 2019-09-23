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
                        Number__c,
                        Cash__c,
                        Type__c,
                        MoneyInCredit__c
                FROM    Card__c
                WHERE   Id = :cardId
        ];
    }
    @AuraEnabled
    public static String minusCard(String idCard, Decimal finalSum, String idATM){
        Card__c card = getCardById(idCard);
        if (finalSum == null){
            return 'null';
        } else if(card.Cash__c >= finalSum){
            card.Cash__c -= finalSum;
            update card;
            minusATM(idATM, finalSum);
            return 'yes';
        }else if(card.Cash__c < finalSum && (card.Cash__c + card.MoneyInCredit__c > finalSum || card.MoneyInCredit__c>finalSum) && card.Type__c == 'Credit'){
            if (card.Cash__c > 0) {
                card.MoneyInCredit__c = card.MoneyInCredit__c - (finalSum - card.Cash__c);
                card.Cash__c -= finalSum;
            } else {
                card.MoneyInCredit__c -= finalSum;
                card.Cash__c -= finalSum;
            }
            update card;
            minusATM(idATM, finalSum);
            return 'credit';
        }else if(card.Cash__c < finalSum && card.Type__c == 'Debit'){
            return 'debit';
        }else {
            return null;
        }
    }
    public static Cash_Machine__c minusATM(String idATM, Decimal finalSum){
        Cash_Machine__c cashMachine = [
                SELECT
                        AmountOfMoney__c
                FROM    Cash_Machine__c
                WHERE   Id =: idATM
        ];
        if(cashMachine.AmountOfMoney__c >= finalSum){
            cashMachine.AmountOfMoney__c -= finalSum;
            update cashMachine;
            return cashMachine;
        }
        return null;
    }
}