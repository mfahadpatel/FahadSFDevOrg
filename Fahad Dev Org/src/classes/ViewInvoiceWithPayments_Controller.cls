public class ViewInvoiceWithPayments_Controller
{    
    public String selectedInvoice { get; set;}     
    
    public Invoice__c InvoiceDetail {get; set;}
    public List<Payment__c> payments { get;set;}
    
    public Map<Id,Invoice__c> InvoiceMap {get;set;}
    
    public ViewInvoiceWithPayments_Controller()
    {
        //selectedInvoice = ''; 
        InvoiceMap = new Map<Id,Invoice__c>();      
    }
    
    public List<SelectOption> getInvoiceNames() 
    {
        List<SelectOption> objNames = new List<SelectOption>();
        objNames.add(new selectOption('', '- None -'));
        List<Invoice__c> AllInvoices = [SELECT id,name,Amount__c,Customer_Name__c FROM Invoice__c];
        for(Invoice__c inv : AllInvoices ){
            objNames.add(new selectoption(inv.id,inv.name));
            InvoiceMap.put(inv.id, inv);
        }
        objNames.Sort();    
        return objNames; 
     }
     
     public pageReference getPayments()
     {
        if (selectedInvoice != '') 
        {
            payments = [Select Id,Name, Amount__c,Payment_Date__c,Invoice_ID__c from Payment__c
                       where Invoice_ID__c =: selectedInvoice
                       order by CreatedDate];
            InvoiceDetail = InvoiceMap.get(Id.valueOf(selectedInvoice));                      
        }
        else
        {
            payments = null;
            InvoiceDetail = null;
        }
         return null;
     }
}