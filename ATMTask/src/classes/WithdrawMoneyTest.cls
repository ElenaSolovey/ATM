/**
 * Created by user on 19-Sep-19.
 */

@IsTest
private class WithdrawMoneyTest {
    @IsTest
    static void getCardByIdTest(){
        Card__c card = TestFactory.testCardOne();
        Card__c cardTest = WithdrawMoneyController.getCardById(card.Id);
        System.assert(cardTest != null);
    }
    @IsTest
    static void minusATMTest(){
        Cash_Machine__c atm = TestFactory.testATMOne();
        Cash_Machine__c atmTest = WithdrawMoneyController.minusATM(atm.Id, 100);
        System.assert(atmTest.AmountOfMoney__c == 1900);
        ////null result
        Cash_Machine__c atmTest2 = WithdrawMoneyController.minusATM(atm.Id, 2500);
        System.assert(atmTest2 == null);
    }
    @IsTest
    static void minusCardTest(){
        Card__c card = TestFactory.testCardDebit();
        //Позитивное тестирование
        String result = WithdrawMoneyController.minusCard(card.Id,100,TestFactory.testATMOne().Id);
        System.assert(result == 'yes');
        //----------
        result = WithdrawMoneyController.minusCard(card.Id,120,TestFactory.testATMOne().Id);
        System.assert(result == 'debit');
        //Негативное ,если final > Cash "CREDIT"
        Card__c card2 = TestFactory.testCardCredit();
        result = WithdrawMoneyController.minusCard(card2.Id,150,TestFactory.testATMOne().Id);
        System.assert(result == 'credit');
        //-----------------null
        result = WithdrawMoneyController.minusCard(card2.Id,250,TestFactory.testATMOne().Id);
        System.assert(result == null);
        //-----------------
        Card__c card3 = TestFactory.testCardBelowZero();
        result = WithdrawMoneyController.minusCard(card3.Id,50,TestFactory.testATMOne().Id);
        System.assert(result == 'credit');
//        //-------------------"null"
        result = WithdrawMoneyController.minusCard(card3.Id,null,TestFactory.testATMOne().Id);
        System.assert(result == 'null');
    }
}