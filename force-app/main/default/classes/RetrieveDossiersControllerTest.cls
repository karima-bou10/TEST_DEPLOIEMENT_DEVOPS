@isTest
public with sharing class RetrieveDossiersControllerTest {
    @TestSetup
    static void makeData(){
            Account accnt = new Account(Name='Nokri');
            Insert accnt;
            
            Dossier__c dossier = new Dossier__c(Name = 'Dossier Test', Compte__c=accnt.Id);

            Insert dossier;
    }     
    @IsTest
    public static void testGetDossiers(){

        Account accnt = [SELECT Id, Name FROM Account WHERE Name = 'Nokri'];
        System.debug(accnt);
        List<Dossier__c> dossiers = RetrieveDossiersController.getDossiers(accnt.Id);
        System.assertEquals(1, dossiers.size(),'msg');
    }

    @IsTest
    public static void testGetDossierById(){

        Dossier__c doss = [SELECT Id, Name FROM Dossier__c WHERE Name = 'Dossier Test' LIMIT 1];
        System.debug(doss);
        Dossier__c dossier = RetrieveDossiersController.getDossierById(doss.Id);
        System.assertEquals(doss.Id, dossier.Id,'msg');
    }

    @IsTest
    public static void testGetDossierByName(){

        //Dossier__c doss = [SELECT Id, Name FROM Dossier__c WHERE Name = 'Dossier Test' LIMIT 1];
        System.debug(doss);
        Dossier__c dossier = RetrieveDossiersController.getDossierByName('Dossier Test');
        System.assertEquals('Dossier Test', dossier.Name,'msg');
    }
}