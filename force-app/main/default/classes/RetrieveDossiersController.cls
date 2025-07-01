public with sharing class RetrieveDossiersController {
    public RetrieveDossiersController() {

    }
    public static List<Dossier__c> getDossiers(String AccountId){
        List<Dossier__c> dossiers = [SELECT Id,Name FROM Dossier__c Where compte__c =: AccountId];
        return dossiers;
    }
    public static Dossier__c getDossierById(String dossierId){
        Dossier__c dossier = [SELECT Id,Name FROM Dossier__c Where Id =: dossierId];
        return dossier;
    }
    public static Dossier__c getDossierByName(String dossierName){
        Dossier__c dossier = [SELECT Id,Name FROM Dossier__c Where Name =: dossierName];
        return dossier;
    }
}