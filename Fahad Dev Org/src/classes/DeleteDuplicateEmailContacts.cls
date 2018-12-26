global class DeleteDuplicateEmailContacts implements
    Database.Batchable<sObject> , Database.Stateful {
    
        global Integer DeletedRecordsCount = 0;
        global Set<String> existingEmails = new Set<String>();
        global List<Contact> duplicateEmailContacts = new List<Contact>();
        
        global Database.QueryLocator start(Database.BatchableContext bc) {
            return Database.getQueryLocator('Select Id,Email from Contact');
        } 
        
        global void execute(Database.BatchableContext bc, List<Contact> scope) {
            
            
            for(Contact contact : scope) {
                if(existingEmails.Contains(contact.Email)) {
                    duplicateEmailContacts.add(contact);          
                    DeletedRecordsCount = DeletedRecordsCount + 1;      
                }
                else {
                    existingEmails.add(contact.Email);
                }            
            } 
            
            delete duplicateEmailContacts;
        } 
        
        global void finish(Database.BatchableContext bc) {
            System.debug(DeletedRecordsCount + ' records deleted. Hurray!');
            AsyncApexJob job = [Select Id, Status, NumberOfErrors,
                JobItemsProcessed,
                TotalJobItems, CreatedBy.Email
                FROM AsyncApexJob
                WHERE Id = :bc.getJobId()];
        }  
    
    }