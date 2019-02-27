Public class CustomControllerButtonClass     //Class
{
    list<account> acts;                  //dynamic list acts
   Public list<Account> getacts()        //method1 to get blank acts to VF page
   {
     return acts;
   }     
   Public PageReference BankingMethod()    //method2 for Banking Account records
   {
    acts= [select name,type,industry,phone,fax from account where industry='Banking'];   
    return null;
   }
   Public PageReference EducationMethod()    //method3 for Education Account records
   {
    acts= [select name,type,industry,phone,fax from account where industry='Education'];   
    return null;
   }
}    
  //Just call the Method on particular button. That record will be displayed 
  // Here no need to make separate table for each record. We can pass values 
  //to DYNAMIC TABLE by calling different method for each record.
  //Create seperate Button of separate table and call method of that table from its button 
  //from VF page code. "So using Dynamic Table and Buttons we can display multiple tables on single VF page".
  //In CommandButton tag pass the attribute action="{!Method_Name}"