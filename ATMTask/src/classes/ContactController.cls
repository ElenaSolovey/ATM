/**
 * Created by user on 03-Sep-19.
 */

public with sharing class ContactController {
    ApexPages.Action saveAction = new ApexPages.Action('{!save}');

    public List<Contact> contacts {get; set;}
    public Contact newContact{get; set;}
    public Contact con;
    public ContactController(ApexPages.StandardController controller){
        con = new Contact();
        getContacts();
    }
    public void getContacts(){
        contacts = [SELECT Id, Name, DoNotCall
        FROM Contact
        WHERE DoNotCall = false
        LIMIT 20];

    }
    public PageReference save(){
        update contacts;

        return null;
    }
}