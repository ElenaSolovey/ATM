/**
 * Created by user on 18-Sep-19.
 */

@IsTest
public class ListATMTest {
    @IsTest
    public static void testBehavior() {
        Bank__c bank = new Bank__c(Name = 'Test1');
        insert bank;

        List<Cash_Machine__c> atm = new List<Cash_Machine__c>();
        for(Integer i= 0; i < 8; i++){
            atm.add(new Cash_Machine__c(
                    Name = 'Name' +i,
                    AmountOfMoney__c = 2000 + i,
                    Bank__c = bank.Id
            ));
        }
        insert atm;
        List<Cash_Machine__c> cashMachines = ListATMController.getAtmList();
        System.assertEquals(atm.size(),cashMachines.size());

    }
}