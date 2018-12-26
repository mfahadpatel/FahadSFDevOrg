@isTest
 private class HelloWorldTestclass {
     static testMethod void validateHelloWorld() {
         Book__c b = new Book__c(Name = 'Behind the Cloud', Price__c = 100);
         System.debug('Price before inserting new book' + b.Price__c);
         
         //Insert Book
         insert b;
         
         //Retrieve new book
         b = [Select Price__c from Book__c where Id = :b.Id];
         System.debug('Price after trigger fired: ' + b.Price__c);
         
         System.assertEquals(90,b.Price__c);
     }     
 }