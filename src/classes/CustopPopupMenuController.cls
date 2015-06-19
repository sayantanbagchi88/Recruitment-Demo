public with sharing class CustopPopupMenuController {

  public Menu_Item__c mi1 {get;set;} // new account to create
  public List<Menu_Item__c> results{get;set;} // search results
  public string searchString{get;set;} // search keyword

  public CustopPopupMenuController() {
    mi1 = new Menu_Item__c();
    // get the current search string
    searchString = System.currentPageReference().getParameters().get('lksrch');
    runSearch();  
  }

  // performs the keyword search
  public PageReference search() {
    runSearch();
    return null;
  }

  // prepare the query and issue the search command
  private void runSearch() {
    // TODO prepare query string for complex serarches & prevent injections
    results = performSearch(searchString);               
  } 

  // run the search and return the records found. 
  private List<Menu_Item__c> performSearch(string searchString) {

    String soql = 'select id, name, Item_Name__c, Restaurant_Name__c, Item_Price__c from Menu_Item__c';
    if(searchString != '' && searchString != null)
      soql = soql +  ' where name LIKE \'%' + searchString +'%\'';
    soql = soql + ' limit 500';
    System.debug(soql);
    return database.query(soql); 

  }

  // save the new account record
  public PageReference saveMenuItem() {
    Database.upsert(mi1);
    // reset the account
    mi1 = new Menu_Item__c();
    return null;
  }

  // used by the visualforce page to send the link to the right dom element
  public string getFormTag() {
    return System.currentPageReference().getParameters().get('frm');
  }
  
  

  // used by the visualforce page to send the link to the right dom element for the text box
  public string getTextBox() {
    return System.currentPageReference().getParameters().get('txt');
  }

}