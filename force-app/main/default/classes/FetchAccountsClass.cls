public with sharing class FetchAccountsClass {
    public FetchAccountsClass() {
        
    }

    public static List<Account> fetchAccountAndContacts(String Name) {
//We now fetch Accounts and Contacts and Only Admins can run this class
        String accountName = '%' + Name + '%';
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, (SELECT Id, Name from COntacts) From Account WHERE Name LIKE :accountName];

        if(accList.size() > 0) {
            return accList;
        }
        return null;
    }
}