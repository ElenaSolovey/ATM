@IsTest
public class ListCardTest {
    @IsTest
    public static void cardListTest(){
        List<Card__c> card = TestFactory.testDataCard();
        List<Card__c> cardList = Card_ATM_Controller.getCardList();
        System.assertEquals(card.size(),cardList.size());
    }
    @IsTest
    public static void getATMByIdTest(){
        Cash_Machine__c atm = TestFactory.testATMOne();
        Cash_Machine__c atmTest = Card_ATM_Controller.getATMById(atm.Id);
        System.assert(atmTest != null);
    }
}