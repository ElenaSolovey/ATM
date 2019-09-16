/**
 * Created by user on 15-Sep-19.
 */

public with sharing class ListATMController {
    @AuraEnabled
    public static List<Cash_Machine__c> getAtmList() {
        List<Cash_Machine__c> a = [
                                    SELECT Id,
                                           Name,
                                           Bank__r.Name,
                                           Bank__r.Commission__c
                                    FROM   Cash_Machine__c
        ];
        return a;
    }
//    @AuraEnabled
//    public static String withdrawMoney(){
//       Cash_Machine__c atm = new Cash_Machine__c();
//        return atm.Id;
//    }
}