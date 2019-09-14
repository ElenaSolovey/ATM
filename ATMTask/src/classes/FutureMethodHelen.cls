/**
 * Created by user on 06-Sep-19.
 */

public with sharing class FutureMethodHelen {
 @Future
 public static void changeMethod(Id id){
     Account account = [SELECT Id,
                               Name
                        FROM Account
                        WHERE Id =: id
                        LIMIT 1];
      account.Name = account.Name + '123';
      update account;
 }
}