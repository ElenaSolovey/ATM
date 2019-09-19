@IsTest
public class ListCardTest {
    @IsTest
    public static void cardListTest(){
        Account account = new Account(Name = 'Alena');
        insert account;
        Bank__c bank = new Bank__c(Name = 'Test1');
        insert bank;
        List<Card__c> card = new List<Card__c>();
            for(Integer i= 0; i < 8; i++){
                card.add(new Card__c(
                        Name = 'Name' +i,
                        AccountId__c = account.Id,
                        Number__c = '1234567891234567',
                        Type__c = 'Debit',
                        Bank__c = bank.Id
                ));
            }
        insert card;
        List<Card__c> cardList = Card_ATM_Controller.getCardList();
        System.assertEquals(card.size(),cardList.size());
    }
    @IsTest
    public static void getATMByIdTest(){
        Bank__c bank = new Bank__c(Name = 'Test1');
        insert bank;
        Cash_Machine__c atm = new Cash_Machine__c(
                Name = 'Name',
                AmountOfMoney__c = 2000,
                Bank__c = bank.Id);
        insert atm;
        Cash_Machine__c atmTest = Card_ATM_Controller.getATMById(atm.Id);
        System.assert(atmTest != null);
    }
}