@IsTest
public class ListATMTest {
    @IsTest
    public static void testBehavior() {
        List<Cash_Machine__c> atm = TestFactory.testDataATM();
        List<Cash_Machine__c> cashMachines = ListATMController.getAtmList();
        System.assertEquals(atm.size(),cashMachines.size());
    }
}