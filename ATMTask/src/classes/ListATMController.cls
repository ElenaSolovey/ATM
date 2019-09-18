public with sharing class ListATMController {
    @AuraEnabled
    public static List<Cash_Machine__c> getAtmList() {
        List<Cash_Machine__c> a = [
                                    SELECT Id,
                                           Name,
                                           Bank__r.Name,
                                           AmountOfMoney__c,
                                           Bank__r.Commission__c
                                    FROM   Cash_Machine__c
        ];
        return a;
    }
}