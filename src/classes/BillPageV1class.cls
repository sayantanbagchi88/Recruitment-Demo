public class BillPageV1class {
    
    public Bill__c b1 {get;set;}
    public Tax__c t1{get;set;}
    public Menu_Item__c mi1 {get;set;}
    public Detail_Menu_Bill__c dmb1 {get;set;}
    public Detail_Tax_Bill__c dtb1 {get;set;}
    public Person_Bill__c pb1 {get;set;}
    public Person_Detail_Bill__c pdb1 {get;set;}
    ApexPages.standardController sc = null;
    
    
    public BillPageV1class() //ApexPages.StandardController controller)
    {
        b1= new Bill__c();
        t1=new Tax__c();
        mi1=New Menu_Item__c();
        
    }
    
    public Pagereference dosave()
    {
        try {
            upsert(b1);
        } 
        
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
    return null;
       // After Save, navigate to the default view page:
       //return (new ApexPages.StandardController(b1)).view();
    }
    
    public pagereference docancel()
    {
        return sc.cancel();
        //return (new ApexPages.StandardController(b1)).view();
    }
    public Pagereference dosave1()
    {
        try {
            upsert(t1);
        } 
        
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
                // After Save, navigate to the default view page:
        //return null;
        return (new ApexPages.StandardController(t1)).view();
    }
    
    public void docancel1()
    {
        //return b1.cancel();
        //return (new ApexPages.StandardController(b1)).view();
    }
    public Pagereference dosave2()
    {
        try {
            upsert(mi1);
        } 
        
        catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
                // After Save, navigate to the default view page:
        //return null;
        return (new ApexPages.StandardController(mi1)).view();
    }
    
    public void docancel2()
    {
        //return b1.cancel();
        //return (new ApexPages.StandardController(b1)).view();
    }
    
    public void addTax()
    {
        List<Tax__c> t2 = new List<Tax__c>();
        t1.Restaurant_Name__c=b1.Restaurant_Name__c;
        upsert(t1);
         
    }
    
    public void addMenuItem()
    {
        mi1.Restaurant_Name__c=b1.Restaurant_Name__c;
        upsert(mi1);
    }
}