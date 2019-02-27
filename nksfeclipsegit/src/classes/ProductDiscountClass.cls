public class ProductDiscountClass {							//Class    
   
    public static void Discount(list<Product_Discount__C> PDlist)
    {
       list <Product_Discount__c> Plist =[select id,Amount__c,Product__r.id,Product__r.name,Product__r.ProductCode 
                                           from Product_Discount__c where id in:PDlist];
       system.debug('Product List after Query:'+Plist);		//Child to parent Query. Product_Discount__c=Child & Product__r=Parent
       set<id>pid= new set <id>();							//Empty set for Parent ID
       decimal BillDiscount;
       for(Product_Discount__c a: Plist)
       {
         pid.add(a.Product__r.id);   		//Add Parent ID into set
       }
        system.debug('product id set:'+pid);
        list<Product2> pplist=[select id,name,(select id,UnitPrice from PricebookEntries),
                               (select Amount__c,Discount_Type__c,Percentage_Discount__c,Flat_Discount__c,Disounted_Bill__c from Product_Discounts__r)
                               from Product2 where id in:Pid];     	//Parent to child query. (Product2==Product) Product2 =Parent
        system.debug('pplist after query:'+pplist);					//PricebookEntries= Child1 & Product_Discounts__r= Child2 
        list<Product_Discount__c> p1list= new list<Product_Discount__c>();	//Empty list
        set<id>pbeid =new set<id>();
        for(Product2 b:pplist)								//Parent for loop
        {
            decimal unit;
            for(PricebookEntry p: b.PricebookEntries)		//Child1 for loop 
            {
               	unit = p.UnitPrice;							//assign unit price of product from child1 to decimal unit
           		system.debug('1st for loop unit price of product:'+unit);  
                pbeid.add(p.id);
            }
            for(Product_Discount__c q:b.Product_Discounts__r)		//Child2 for loop
            {
               q.Amount__c = unit;  						//assign unit price to Amount__c field of child2
               system.debug('2nd for loop "amount" field of child2:'+q.Amount__c);    
         
               if(q.Discount_Type__c == 'Flat Discount')
               {
                   q.Disounted_Bill__c = q.Amount__c-q.Flat_Discount__c;
               }
               if(q.Discount_Type__c == 'Percentage Discount')
               {
                  q.Disounted_Bill__c = q.Amount__c - ((q.Amount__c* q.Percentage_Discount__c)/100);
               }
                system.debug('Discount Bill field:'+q.Disounted_Bill__c); 
                p1list.add(q);								//add objecte into Empty list
             }
         } 
         update p1list;										//Update list
         system.debug('updated list:'+p1list);   
         system.debug('pbeid set:'+pbeid);
    }
    
    Public static void DiscountUpdate(list<Product_Discount__c> pdlist1)
    {
        list<Product_Discount__c> pdlist2= [select id,Product__c, Amount__c, Disounted_Bill__c,Discount_Type__c,Flat_Discount__c, 
                                            Percentage_Discount__c FROM Product_Discount__c WHERE Id in:pdlist1];
        list<Product_Discount__c> pdlist3 = new list<Product_Discount__c>();
        for(Product_Discount__c pd:pdlist2)
        {
            if(pd.Discount_Type__c == 'Flat Discount')
               {
                   pd.Disounted_Bill__c = pd.Amount__c-pd.Flat_Discount__c;
               }
             if(pd.Discount_Type__c == 'Percentage Discount')
               {
                  pd.Disounted_Bill__c = pd.Amount__c - ((pd.Amount__c* pd.Percentage_Discount__c)/100);
               }
            system.debug('inside for Discounted Bill:'+pd.Disounted_Bill__c);
            pdlist3.add(pd);
        }
        system.debug('outside for pdlist3:'+pdlist3);
    }
 }