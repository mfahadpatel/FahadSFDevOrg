trigger ValidateInvoiceAmount on Payment__c (before insert,before update,after delete, after insert, after update) {
    Payment__c[] objPay_new = trigger.new;
    
    if(Trigger.isBefore) {  
                     
            Invoice_Payment.ValidateAmount(objPay_new);   
             
    }
    
    if(Trigger.isAfter) {        
        Payment__c[] objPay_old = trigger.old;
        map <id,Payment__c> objPay_oldMap = trigger.OldMap;
        if(Trigger.isInsert) {
            Invoice_Payment.Update_Invoice_TotalPay(objPay_oldMap, objPay_old, objPay_new,'insert');
        }
        
        if(Trigger.isUpdate) {
            Invoice_Payment.Update_Invoice_TotalPay(objPay_oldMap, objPay_old, objPay_new,'update');
        }
        
        if(Trigger.isDelete) {
            Invoice_Payment.Update_Invoice_TotalPay(objPay_oldMap, objPay_old, objPay_new,'delete');
        }        
    }    
}