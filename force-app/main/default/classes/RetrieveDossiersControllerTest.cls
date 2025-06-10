@isTest
public with sharing class RetrieveDossiersControllerTest {
    @TestSetup
    static void makeData(){
            Account accnt = new Account(Name='Nokri');
            Insert accnt;
            
            Dossier__c dossier = new Dossier__c(Compte__c=accnt.Id);

            Insert dossier;
    }     
    @IsTest
    public static void testGetDossiers(){

        Account accnt = [SELECT Id, Name FROM Account WHERE Name = 'Nokri'];
        System.debug(accnt);
        List<Dossier__c> dossiers = RetrieveDossiersController.getDossiers(accnt.Id);
        System.assertEquals(1, dossiers.size(),'msg');
    }

}