trigger CheckInDebugLogs on Job_Application__c (before insert, before update) {

    for(Job_Application__c ja : trigger.new){
        if(trigger.isinsert)
        {
            if(ja.Status__c == 'New')
            {
            ja.Status__c = 'Review Resume';
                System.Debug(ja.Candidate__c + ' applied For position ' + ja.Position__c + '. Insert Trigger');
            }
            if(ja.Status__c == 'Hired')
            {
                System.Debug(ja.Candidate__c + ' is Hired For position ' + ja.Position__c + '. Insert Trigger');
            }
        
        }
        
        if(trigger.isupdate)
        {
            if(ja.Status__c == 'New')
            {
                ja.Status__c = 'Review Resume';
                System.Debug(ja.Candidate__c + ' applied For position ' + ja.Position__c + '. Update Trigger');
            }
            if(ja.Status__c == 'Hired')
            {
                System.Debug(ja.Candidate__c + ' is Hired For position ' + ja.Position__c + '. Update Trigger');
            }
        
        }
        
    }
}