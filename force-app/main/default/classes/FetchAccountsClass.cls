public with sharing class FetchAccountsClass {
    public FetchAccountsClass() {
        
    }

    public static List<Account> fetchAccount(String Name) {

        String accountName = '%' + Name + '%';
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name From Account WHERE Name LIKE :accountName];

        if(accList.size() > 0) {
            return accList;
        }
        return null;
    }
}