@isTest
public with sharing class RetrieveDossiersControllerTest {
    @TestSetup
    static void makeData(){
            Account accnt = new Account(Name='Nokri');
            Insert accnt;
            
            Dossier__c dossier = new Dossier__c(Name = 'Dossier Test', Compte__c=accnt.Id);
            Dossier__c dossier2 = new Dossier__c(Name = 'Dossier Test 2', Compte__c=accnt.Id);
            insert new List<Dossier__c>{dossier, dossier2};


            Dossier__c dossier3 = new Dossier__c(Name='AlphaTest');
            Dossier__c dossier4 = new Dossier__c(Name='AlphaDemo');
            Dossier__c dossier5 = new Dossier__c(Name='BetaTest');
            insert new List<Dossier__c>{dossier3, dossier4, dossier5};
    }     
    @IsTest
    public static void testGetDossiers(){

        Account accnt = [SELECT Id, Name FROM Account WHERE Name = 'Nokri'];
        System.debug(accnt);
        List<Dossier__c> dossiers = RetrieveDossiersController.getDossiers(accnt.Id);
        System.assertEquals(2, dossiers.size(),'msg');
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
        //System.debug(doss);
        Dossier__c dossier = RetrieveDossiersController.getDossierByName('Dossier Test');
        System.assertEquals('Dossier Test', dossier.Name,'msg');
    }

    @isTest
    static void testCountAllDossiers() {
        Integer count = RetrieveDossiersController.countAllDossiers();
        System.assertEquals(5, count, 'Should return the correct count of dossiers');
    }

    @isTest
    static void testGetDossiersCreatedAfter() {
        Date today = Date.today();
        List<Dossier__c> result = RetrieveDossiersController.getDossiersCreatedAfter(today.addDays(-1));
        System.assertEquals(5, result.size(), 'Should return only dossiers created after the given date');
    }

    @isTest
    static void testGetDossiersByNamePrefix() {
        List<Dossier__c> result = RetrieveDossiersController.getDossiersByNamePrefix('Alpha');
        System.assertEquals(2, result.size(), 'Should return dossiers with names starting with Alpha');
        for(Dossier__c d : result) {
            System.assert(d.Name.startsWith('Alpha'));
        }
    }
}