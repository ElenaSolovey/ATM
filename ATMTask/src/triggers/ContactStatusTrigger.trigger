/**
 * Created by user on 29-Aug-19.
 */

trigger ContactStatusTrigger on Contact (after insert, after delete ) {
    List<Account> accountsId = [SELECT Id,Status_ON__c,Status_OFF__c
                                FROM Account ] ;
    if(Trigger.isInsert && Trigger.isAfter) {
        for (Contact cont : Trigger.new) {
            for (Account acc : accountsId) {
                if (acc.Id.equals(cont.AccountId)) {
                    acc.Status_ON__c = Integer.valueOf(cont.Account.Status_ON__c) + 1 ;
                } else {
                    acc.Status_OFF__c = Integer.valueOf(cont.Account.Status_OFF__c) + 1 ;
                }
            }

        }
    }
    if(Trigger.isDelete && Trigger.isAfter) {
        for (Contact cont : Trigger.old) {
            for (Account acc : accountsId) {
                if (acc.Id.equals(cont.AccountId)) {
                    acc.Status_ON__c = Integer.valueOf(cont.Account.Status_ON__c) - 1 ;
                    break;
                } else {
                    acc.Status_OFF__c = Integer.valueOf(cont.Account.Status_OFF__c) - 1 ;
                }
            }
        }
}
}