@RestResource(urlMapping='/Boximage/')
global with sharing class boxClasss {
    
     @HttpPost
    global static String doPost() {
        Account account = new Account();
        account.Name = 'myname2222';
        account.phone = '1234567890';
        account.website = 'dajdfhau@djahdu.dadgh';
        insert account;
        return account.Id;
    }

}