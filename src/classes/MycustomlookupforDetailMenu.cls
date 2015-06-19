public with sharing class MycustomlookupforDetailMenu {

        
        public Detail_Menu_Bill__c mi1{get;set;}
        PageReference retPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));  
        // public PageReference retPage = new ApexPages.StandardController(mi1).view();
 /*      
        public MycustomlookupforDetailMenu()
        {
                mi1= new Detail_Menu_Bill__c();
        }
 */       
        public MycustomlookupforDetailMenu(ApexPages.StandardController sc)
        {
                mi1= new Detail_Menu_Bill__c();
               
        }
        
        public pagereference dosave()
        { 
        
        try {
        
          upsert(mi1);
        } 
        
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            System.Debug('+++++++++++++++' + e);
            //return null;
            return retPage;
            
        }
        retPage.setRedirect(true);
                // After Save, navigate to the default view page:
        //return null;
        //return (new ApexPages.StandardController(mi1)).view();
        return retPage;
        //return retURL;
        }
/*        
        public pagereference docancel()
        {
            retPage.setRedirect(true);
            //return retURL;
            //return null;
            return retPage;
            //return (new ApexPages.StandardController(mi1)).view();
        }
*/
}