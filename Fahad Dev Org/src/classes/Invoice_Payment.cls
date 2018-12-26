public class Invoice_Payment{

    public static void ValidateAmount(Payment__c[] pay){
    /*
        //Get ivoice IDs
        set<Id> InvoiceIds = new set<Id>();
        for(Payment__c objPayment : pay){
            InvoiceIds.add(objPayment.Invoice_ID__c); 
        }  
        
        //Get amount of each invoice
        Map<Id,Decimal> invoiceAmountsMap = new Map<Id,Decimal>();
        //    [Select Amount__c from Invoice__c where Id in : InvoiceIds]);    
            
        Map<Invoice__c, List<SObject>> InvoicePaymentList = new Map<Invoice__c, List<SObject>>();
        for (Invoice__c p : [
                SELECT Id, Amount__c,Total_Payment_Recieved__c, (SELECT Id,Amount__c FROM Payments__r)
                FROM Invoice__c
                ]) 
        {
            InvoicePaymentList.put(p, p.Payments__r);
            invoiceAmountsMap.put(p.Id,p.Amount__c);
        }
        
        Decimal Invoice_Amount;
        Decimal SumPaymentAmount = 0;
        
               
                   
        for(Invoice__c objInvoice : InvoicePaymentList.keySet()){  
                      
            Invoice_Amount = objInvoice.Amount__c;                       
            
            //Sum Previous Payment Amount
            if(InvoicePaymentList.get(objInvoice).size() > 0){                
                
                List<Payment__c> listPreviousPayment = InvoicePaymentList.get(objInvoice);
                for(Payment__c objPrePay : listPreviousPayment){
                    //don't check amount of current payment id on update
                    if(objInvoice. != objPrePay.ID)
                        SumPaymentAmount += objPrePay.Amount__c;
                }
            }
            
            //Add new amount in sum of previous sum amount
            SumPaymentAmount += objPayment.Amount__c;               
            
            if(SumPaymentAmount > Invoice_Amount){
                objPayment.AddError('Payment amount exceeds than invoice amount SumPaymentAmount = ' + SumPaymentAmount + ' Invoice Amount = ' + Invoice_Amount);
            }        
        
        }  
        
        //System.Debug('Invoice Amount is ' + Invoice_Amount + ' and Sum of this and previous payment is ' + SumPaymentAmount);
        */
    }
    
    public static void Update_Invoice_TotalPay(map <id,Payment__c> objPay_oldMap, Payment__c[] objPay_old, Payment__c[] objPay_new, String EntryType) {
    /*
        set<Id> InvoiceIds = new set<Id>();
        List<Invoice__c> InvoiceToUpdate = new List<Invoice__c>();
        
        if(EntryType == 'insert' || EntryType == 'update')
        {
            for(Payment__c objPayment : objPay_new){
                InvoiceIds.add(objPayment.Invoice_ID__c); 
            }  
            
            Map<Id,Invoice__c> invoiceAmountsMap = new Map<Id,Invoice__c>(
                [Select Id,Total_Payment_Recieved__c,Status__c,Amount__c from Invoice__c where Id in : InvoiceIds]);
                
            Decimal Total_Paid_Amount;
            Decimal Invoice_Amount;
            //String Invoice_Status;
            
            for(Payment__c objPayment : objPay_new){
            
                Total_Paid_Amount = invoiceAmountsMap.get(objPayment.Invoice_ID__c).Total_Payment_Recieved__c;
                Invoice_Amount = invoiceAmountsMap.get(objPayment.Invoice_ID__c).Amount__c;
                //Invoice_Status = invoiceAmountsMap.get(objPayment.Invoice_ID__c).Status__c;
                
                if(EntryType == 'insert') {
                    Total_Paid_Amount += objPayment.Amount__c;
                }
                
                if(EntryType == 'update') {
                    Decimal Prev_Paid_Amount = objPay_oldMap.get(objPayment.Id).Amount__c;
                    Total_Paid_Amount -= Prev_Paid_Amount ;
                    Total_Paid_Amount += objPayment.Amount__c;
                }                                
                
                invoiceAmountsMap.get(objPayment.Invoice_ID__c).Total_Payment_Recieved__c = Total_Paid_Amount;
                //if(Invoice_Amount  == Total_Paid_Amount)
                //{
                //    invoiceAmountsMap.get(objPayment.Invoice_ID__c).Status__c = 'Paid';
                //}
                //else if(Invoice_Amount > Total_Paid_Amount && Invoice_Status == 'Paid')
                //{
                //      invoiceAmountsMap.get(objPayment.Invoice_ID__c).Status__c = 'Updated';
                //}
                InvoiceToUpdate.Add(invoiceAmountsMap.get(objPayment.Invoice_ID__c));                
            }
        }
        else if(EntryType == 'delete')
        {
            for(Payment__c objPayment : objPay_old){
                InvoiceIds.add(objPayment.Invoice_ID__c); 
            }  
            
            Map<Id,Invoice__c> invoiceAmountsMap = new Map<Id,Invoice__c>(
                [Select Id,Total_Payment_Recieved__c,Status__c,Amount__c from Invoice__c where Id in : InvoiceIds]);
                
            Decimal Total_Paid_Amount;
            Decimal Invoice_Amount;
            //String Invoice_Status;
            
            for(Payment__c objPayment : objPay_old){
            
                Total_Paid_Amount = invoiceAmountsMap.get(objPayment.Invoice_ID__c).Total_Payment_Recieved__c;
                Invoice_Amount = invoiceAmountsMap.get(objPayment.Invoice_ID__c).Amount__c;
                //Invoice_Status = invoiceAmountsMap.get(objPayment.Invoice_ID__c).Status__c;
                
                Total_Paid_Amount -= objPayment.Amount__c; 
                
                invoiceAmountsMap.get(objPayment.Invoice_ID__c).Total_Payment_Recieved__c = Total_Paid_Amount;
                //if(Invoice_Status == 'Paid')
                //{
                //    invoiceAmountsMap.get(objPayment.Invoice_ID__c).Status__c = 'Updated';
                //}
                InvoiceToUpdate.Add(invoiceAmountsMap.get(objPayment.Invoice_ID__c));    
             }          
        }
        
        update InvoiceToUpdate;
        */
    }
}