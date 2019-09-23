/**
 * Created by user on 19-Sep-19.
 */

@IsTest
private class MoneyToCardSchedulerTest {
    public static String str = '0 0 0 24 9 ? 2019';
    public static testMethod void ScheduledJobTest() {
        Account account = new Account(Name = 'Alena');
        insert account;
        Bank__c bank = new Bank__c(Name = 'Test1', Commission__c = 10 );
        insert bank;
        Card__c card = new Card__c(
                Name = 'Name' ,
                AccountId__c = account.Id,
                Cash__c = 10,
                Number__c = '1234567891234567',
                Type__c = 'Debit',
                Bank__c = bank.Id
        );
        insert card;
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', str , new MoneyToCardScheduler());
        CronTrigger ct = [
                SELECT Id,
                        CronExpression,
                        TimesTriggered,
                        NextFireTime
                FROM    CronTrigger
                WHERE   Id =: jobId
        ];
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2019-09-24 00:00:00', String.valueOf(ct.NextFireTime));
        Test.stopTest();
    }
}