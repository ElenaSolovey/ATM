global class BatchHeln implements Database.Batchable<sObject>{
    global final String query;
    global BatchHeln(String q){
        query = q;
    }
    global DataBase.QueryLocator start(Database.BatchableContext bc){
    return Database.getQueryLocator('SELECT Id, Name  FROM Acoount WHERE LastModifiedBy = TODAY');
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        List<Account> account = new List<Account>();
        for (Account  a : scope){
            account.add(a);
        }
        update account;
    }
    global void finish(Database.BatchableContext bc){

    }

   }