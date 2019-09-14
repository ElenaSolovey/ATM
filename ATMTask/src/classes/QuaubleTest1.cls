/**
 * Created by user on 06-Sep-19.
 */

@IsTest
private class QuaubleTest1 {
    @IsTest
    static void testBehavior() {
        Test.startTest();
        System.enqueueJob(new QueuableApex());
        Test.stopTest();

        Account account = [SELECT Id, Name
                       FROM Account
                       LIMIT 1];
        System.assertEquals('fghj', account.Name );

    }
}