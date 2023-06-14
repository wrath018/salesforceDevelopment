@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager {
  @HttpPost
    global static String doPost() {
         RestRequest req=Restcontext.request;
        Restresponse res =Restcontext.response;
        String parsebody=req.requestbody.tostring();
        JSONParser parser=JSON.createParser(parsebody);
        system.debug(parsebody+'testPush  ');
        Integer idValue;
String email;
String lastName;
while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String fieldName = parser.getText();
                if (fieldName == 'id') {
                    parser.nextToken();
                    idValue = parser.getIntegerValue();
                } else if (fieldName == 'email') {
                    parser.nextToken();
                    email = parser.getText();
                } else if (fieldName == 'last_name') {
                    parser.nextToken();
                    lastName = parser.getText();
                }
            }
        }
    }
}
System.debug(idValue);
System.debug(email);
System.debug(lastName+'lastname');



  
        lead account = new lead();
        account.lastName = lastName;
        account.email=email;
        account.Company='test';
        account.Description=string.valueOf(idValue);
        insert account;
        return account.Id;
    }
}