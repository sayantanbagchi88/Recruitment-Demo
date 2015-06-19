public with sharing class MycustomlookupforDetailTax {
        
        public Detail_Tax_Bill__c dt1{get;set;}
         PageReference retPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));
        
 /*       public MycustomlookupforDetailTax()
        {
                dt1= new Detail_Tax_Bill__c();
        }
 */       
        
        public MycustomlookupforDetailTax(ApexPages.StandardController sc)
        {
                dt1= new Detail_Tax_Bill__c();
        }
        
        public pagereference dosave()
        { 
        try {
          upsert(dt1);
        } 
        
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            //return null;
             return retPage;
            
        }
                // After Save, navigate to the default view page:
         return retPage;
        //return null;
        //return (new ApexPages.StandardController(dt1)).view();
        }
 /*       
        public pagereference docancel()
        {
           cancel();
         return retPage;
        //return (new ApexPages.StandardController(dt1)).view();
        }
*/
}