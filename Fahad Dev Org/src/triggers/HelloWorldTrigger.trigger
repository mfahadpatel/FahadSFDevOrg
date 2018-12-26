trigger HelloWorldTrigger on Book__c (before Insert) {
    Book__c[] books = trigger.new;
    MyHelloWorld.applyDiscount(books);
}