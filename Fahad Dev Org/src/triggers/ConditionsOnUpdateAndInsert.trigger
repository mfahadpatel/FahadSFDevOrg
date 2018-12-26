trigger ConditionsOnUpdateAndInsert on Invoice__c (before insert, before update) {
       
    Invoice__c[] objInv = trigger.new;
    Map<id,Invoice__c> objInv_OldMap = trigger.OldMap;
    for(Invoice__c inv : objInv) 
    {
        if(trigger.isUpdate)
        {
            //if(objInv_OldMap.get(inv.Id).Status__c == 'Paid')
            //{
            //    inv.AddError('Paid invoice cannot be edited');
            //}
            //else
            //{            
                if(inv.Amount__c == inv.Total_Payment_Recieved__c)
                {
                    inv.Status__c = 'Paid';
                }
                else if(inv.Amount__c < inv.Total_Payment_Recieved__c)
                {
                    inv.AddError('Invoice amount cannot be less than paid amount');
                }
                else
                {
                    inv.Status__c = 'Updated';
                }
            //}
        }
        else if(trigger.isInsert)
        {               
            inv.Total_Payment_Recieved__c = 0;
            inv.Status__c = 'Created';            
         }
    }         
    
     

}