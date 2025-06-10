@isTest
public with sharing class FetchAccountsClassTest {
    
    @IsTest
    public static void tester(){
        
        Account accnt = new Account(Name='Nokri');
        Insert accnt;

        FetchAccountsClass.fetchAccountAndContacts('Nokri');
    }
}