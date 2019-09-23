/**
 * Created by user on 23-Sep-19.
 */

@IsTest
public class TestFactory {
    public static Bank__c insertBank(){
        Bank__c bank = new Bank__c(Name = 'Test1');
        insert bank;
        return bank;
    }
    public static Account insertAccount(){
        Account account = new Account(Name = 'Alena');
        insert account;
        return account;
    }
    public static List<Cash_Machine__c> testDataATM() {
        List<Cash_Machine__c> atm = new List<Cash_Machine__c>();
        for(Integer i= 0; i < 8; i++){
            atm.add(new Cash_Machine__c(
                    Name = 'Name' +i,
                    AmountOfMoney__c = 2000 + i,
                    Bank__c = insertBank().Id
            ));
        }
        insert atm;
        return atm;
    }
    public static Cash_Machine__c testATMOne(){
        Cash_Machine__c atm = new Cash_Machine__c(
                Name = 'Name',
                AmountOfMoney__c = 2000,
                Bank__c = insertBank().Id);
        insert atm;
        return atm;
    }
    public static Card__c testCardOne(){
        Card__c card = new Card__c(
                Name = 'Name' ,
                AccountId__c = insertAccount().Id,
                Number__c = '1234567891234567',
                Type__c = 'Debit',
                Bank__c = insertBank().Id
        );
        insert card;
        return card;
    }
    public static Card__c testCardDebit(){
        Card__c card = new Card__c(
                Name = 'Name' ,
                AccountId__c = insertAccount().Id,
                Number__c = '1234567891234567',
                MoneyInCredit__c = 0,
                Cash__c = 100,
                Type__c = 'Debit',
                Bank__c = insertBank().Id
        );
        insert card;
        return card;
    }
    public static Card__c testCardCredit(){
        Card__c card = new Card__c(
                Name = 'Name' ,
                AccountId__c = insertAccount().Id,
                Number__c = '1234567891234567',
                MoneyInCredit__c = 100,
                Cash__c = 100,
                Type__c = 'Credit',
                Bank__c = insertBank().Id
        );
        insert card;
        return card;
    }
    public static Card__c testCardBelowZero(){
        Card__c card = new Card__c(
                Name = 'Name' ,
                AccountId__c = insertAccount().Id,
                Number__c = '1234567891234567',
                MoneyInCredit__c = 100,
                Cash__c = -10,
                Type__c = 'Credit',
                Bank__c = insertBank().Id
        );
        insert card;
        return card;
    }
    public static List<Card__c> testDataCard(){
        List<Card__c> card = new List<Card__c>();
        for(Integer i= 0; i < 8; i++){
            card.add(new Card__c(
                    Name = 'Name' +i,
                    AccountId__c = insertAccount().Id,
                    Number__c = '1234567891234567',
                    Type__c = 'Debit',
                    Bank__c = insertBank().Id
            ));
        }
        insert card;
        return card;
    }
}