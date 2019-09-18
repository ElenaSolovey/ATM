global  class MoneyToCardScheduler implements Schedulable{
    global void execute(SchedulableContext ctx) {
        List<Card__c> cards = [
                                 SELECT
                                        Cash__c,
                                        Bank__r.Percent__c
                                 FROM   Card__c
                                 WHERE  Cash__c > 0];
        for (Card__c card: cards){
            card.Cash__c += card.Cash__c*card.Bank__r.Percent__c*0.01;
        }
        update cards;
    }
}