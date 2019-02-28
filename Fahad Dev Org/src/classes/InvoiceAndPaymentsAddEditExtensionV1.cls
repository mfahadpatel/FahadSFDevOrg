public class InvoiceAndPaymentsAddEditExtensionV1 {
    private ApexPages.StandardController std;
    
    //the associated payment
    public List<Payment__c> payments {get; set;}
    
    public Id chosenPaymentID {get; set;}
    
    public InvoiceAndPaymentsAddEditExtensionV1(ApexPages.StandardController stdCtrl)
    {
        std=stdCtrl; 
        getPayments();       
    }
    
    public Invoice__c getInvoice()
    {
        return (Invoice__c) std.getRecord();
    }
    
    private boolean updatePayments()
    {
        /*boolean result=true;
        if (null!= payments)
        {
              List<Payment__c> updPayments = new List<Payment__c>();
              try
              {
                   update payments;
              }
              catch (Exception e)
              {
                 String msg=e.getMessage();
                 integer pos;
                  
                 // if its field validation, this will be added to the messages by default
                 if (-1==(pos=msg.indexOf('FIELD_CUSTOM_VALIDATION_EXCEPTION, ')))
                 {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, msg));
                 }
                  
                 result=false;
              }
        }
        
       return result;
       */
       return true;
    }
    
    public PageReference saveAndExit()
    {
         boolean result=true;
         result=updatePayments();
          
         if (result)
         {
            // call standard controller save
            return std.save();
         }
         else
         {
          return null;
         }
    }
    
    public PageReference save()
    {
         Boolean result=true;
         PageReference pr=Page.CreateInvoiceWithPayments;
         if (null!=getInvoice().id)
         {
              //result=updatePayments();
              if (null!= payments)
              {
                  List<Payment__c> Payments_ToInsert = new List<Payment__c>();
                  List<Payment__c> Payments_ToUpdate = new List<Payment__c>();
                  try
                  {
                  	   //for(Payment__c p:payments)
                  	   //{
                  	   //		if(p.Id != null)
                  	   //			Payments_ToUpdate.add()
                  	   //}
                       upsert payments;
                  }
                  catch (Exception e)
                  {
                     String msg=e.getMessage();
                     integer pos;
                      
                     // if its field validation, this will be added to the messages by default
                     if (-1==(pos=msg.indexOf('FIELD_CUSTOM_VALIDATION_EXCEPTION, ')))
                     {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, msg));
                     }
                  }
              }
         }
         else
         {
              pr.setRedirect(true);
         }
          
         if (result)
         {
            // call standard controller save, but don't capture the return value which will redirect to view page
                //std.save();
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Changes saved'));
                getPayments();
         }
         pr.getParameters().put('id', getInvoice().id);
          
         //return pr;
         return null;
    }
     
    public void newPayment()
    {
       /*if (updatePayments())
       {
          Payment__c payment = new Payment__c(Payment_Date__c=date.today(),Amount__c=0,Invoice_ID__c=getInvoice().id);
          insert payment;
         
          // null the contacts list so that it is rebuilt
          payments=null;
       }*/
       
       Payment__c payment = new Payment__c(Payment_Date__c=date.today(),Amount__c=0,Invoice_ID__c=getInvoice().id);
       payments.add(payment);
    }
    
    public void deletePayment()
    {
       if (updatePayments())
       {
          if (chosenPaymentId != null)
          {
             
             try
             {
             	Payment__c payment = new Payment__c(Id=chosenPaymentId);
                delete payment;
                 
                 getPayments();
                // null the contacts list so that it is rebuilt
                //payments = null;
                chosenPaymentId=null;
             }
             catch (Exception e)
             {
                 String msg=e.getMessage();
                 integer pos;
                  
                 // if its field validation, this will be added to the messages by default
                 if (-1==(pos=msg.indexOf('FIELD_CUSTOM_VALIDATION_EXCEPTION, ')))
                 {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, msg));
                 }                                   
             }        
          }
          else
          {
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'no chose payment Id'));
          }          
       }
    }
    
    public List<Payment__c> getPayments()
    {
    
        if ( (null!=getInvoice().id) && (payments == null) )
        {
           payments = [Select Id,Name, Amount__c,Payment_Date__c,Invoice_ID__c from Payment__c
                       where Invoice_ID__c =: getInvoice().id
                       order by CreatedDate];
        }
                           
        return payments ;
    }
    
}