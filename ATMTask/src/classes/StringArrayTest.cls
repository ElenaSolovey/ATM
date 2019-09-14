/**
 * Created by user on 27-Aug-19.
 */

public with sharing class StringArrayTest {

    public static void generateStringArray(Integer n){

        List<String> myList = new List<String>();
        for (Integer i = 0; i <n ; i++) {
            myList.add('Test' + i);
        }
    }
}