public class OppProductclass {
    public static void OppProduct(list<OpportunityLineItem>olilist)
    {
        list<OpportunityLineItem> opline= [select id,opportunityID,name,Quantity,Total_Discounted_Bill__c,Unit_Discounted_Bill__c, 
                                           opportunity.Net_Discounted_Bill__c, Pricebookentry.Product2.Id
                                          from OpportunityLineItem where id in:olilist];
        set<id>oppidset = new set<id>();
        set<id>productidset= new set<id>();
        for(OpportunityLineItem op: opline)
        {
            oppidset.add(op.opportunityID);
            productidset.add(op.Pricebookentry.Product2.Id);
        }
        system.debug('opp id set:'+oppidset);
        system.debug('Product id set:'+productidset);
        Decimal Bill=0;
        list<product2>prodlist= [select id,name, (select Disounted_Bill__c from Product_Discounts__r)
                                 from product2 where id in:productidset];
        list<OpportunityLineItem> opplineupdatelist= new list<OpportunityLineItem>();
        for(product2 pd2:prodlist)
        {
            for(Product_Discount__C pd:pd2.Product_Discounts__r)
            {
                Bill= pd.Disounted_Bill__c;
            }
         }
        system.debug('Discounted Bill outer:'+Bill);
        
   //     list<OpportunityLineItem> opplineupdatelist= new list<OpportunityLineItem>();
        for(OpportunityLineItem op1: opline)
        {
            op1.Unit_Discounted_Bill__c = Bill;
            op1.Total_Discounted_Bill__c = op1.Quantity * op1.Unit_Discounted_Bill__c;
         //   op1.opportunity.Net_Discounted_Bill__c = op1.Total_Discounted_Bill__c;
            opplineupdatelist.add(op1);
        } 
        update opplineupdatelist;
     //   update opline;
        system.debug('Updated Opp Line Item List:'+opplineupdatelist);
        
        list<Opportunity> oppupdatelist= new list<Opportunity>();
        list<Opportunity> opplist= [select id,name,Net_Discounted_Bill__c,
                                    (select name,Total_Discounted_Bill__c from OpportunityLineItems)
                                   from Opportunity where id =:oppidset];
        decimal totalbill=0;
        for(Opportunity op3: opplist)
        {
            for(OpportunityLineItem op4: op3.OpportunityLineItems)
            {
                totalbill += op4.Total_Discounted_Bill__c;
            }
            system.debug('totalbill outer:'+totalbill);
            op3.Net_Discounted_Bill__c = totalbill;
            oppupdatelist.add(op3);
        }
        update oppupdatelist;
      //  update opplist;
        system.debug('Updated Opp list:'+oppupdatelist);
    }
 }