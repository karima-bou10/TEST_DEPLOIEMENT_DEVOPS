public with sharing class RetrieveDossiersController {
    public RetrieveDossiersController() {

    }
    public static List<Dossier__c> getDossiers(String AccountId){
        List<Dossier__c> dossiers = [SELECT Id,Name FROM Dossier__c Where compte__c =: AccountId];
        return dossiers;
    }
}