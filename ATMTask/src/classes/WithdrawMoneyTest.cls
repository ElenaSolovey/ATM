/**
 * Created by user on 19-Sep-19.
 */

@IsTest
private class WithdrawMoneyTest {
    @IsTest
    static void getCardByIdTest(){
        Account account = new Account(Name = 'Alena');
        insert account;
        Bank__c bank = new Bank__c(Name = 'Test1');
        insert bank;
        Card__c card = new Card__c(
                Name = 'Name' ,
                AccountId__c = account.Id,
                Number__c = '1234567891234567',
                Type__c = 'Debit',
                Bank__c = bank.Id
        );
        insert card;
        Card__c cardTest = WithdrawMoneyController.getCardById(card.Id);
        System.assert(cardTest != null);
    }
    @IsTest
    static void minusATMTest(){
        Decimal finalSum = 100;
        Bank__c bank = new Bank__c(Name = 'Test1');
        insert bank;
        Cash_Machine__c atm = new Cash_Machine__c(
                Name = 'Name',
                AmountOfMoney__c = 2000,
                Bank__c = bank.Id);
        insert atm;
        Cash_Machine__c atmTest = WithdrawMoneyController.minusATM(atm.Id, finalSum);
        System.assert(atmTest.AmountOfMoney__c == 1900);
        ////null result
        finalSum = 2500;
        Cash_Machine__c atmTest2 = WithdrawMoneyController.minusATM(atm.Id, finalSum);
        System.assert(atmTest2 == null);
    }
    @IsTest
    static void minusCardTest(){
        Decimal finalSum = 100;
        Account account = new Account(Name = 'Alena');
        insert account;
        Bank__c bank = new Bank__c(Name = 'Test1');
        insert bank;
        Cash_Machine__c atm = new Cash_Machine__c(
                Name = 'Name',
                AmountOfMoney__c = 2000,
                Bank__c = bank.Id);
        insert atm;
        Card__c card = new Card__c(
                Name = 'Name' ,
                AccountId__c = account.Id,
                Number__c = '1234567891234567',
                MoneyInCredit__c = 0,
                Cash__c = 100,
                Type__c = 'Debit',
                Bank__c = bank.Id
        );
        insert card;
        //Позитивное тестирование
        String result = WithdrawMoneyController.minusCard(card.Id,finalSum,atm.Id);
        System.assert(result == 'yes');
        //----------
        finalSum = 120;
        result = WithdrawMoneyController.minusCard(card.Id,finalSum,atm.Id);
        System.assert(result == 'debit');
        //Негативное ,если final > Cash "CREDIT"
        finalSum = 150;
        Card__c card2 = new Card__c(
                Name = 'Name' ,
                AccountId__c = account.Id,
                Number__c = '1234567891234567',
                MoneyInCredit__c = 100,
                Cash__c = 100,
                Type__c = 'Credit',
                Bank__c = bank.Id
        );
        insert card2;
        result = WithdrawMoneyController.minusCard(card2.Id,finalSum,atm.Id);
        System.assert(result == 'credit');

    }
}