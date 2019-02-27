trigger ProductDiscountTrigger on Product_Discount__c (After insert,Before update) 
{
    if(Trigger.isInsert && Trigger.isAfter) 
    {
        ProductDiscountClass.Discount(Trigger.new);
    }
    
    if(Trigger.isUpdate && Trigger.isBefore)
    {
     // ProductDiscountClass.DiscountUpdate(Trigger.new);  
     for(Product_Discount__c q: trigger.new)
     {
          if(q.Discount_Type__c == 'Flat Discount')
               {
                   q.Disounted_Bill__c = q.Amount__c-q.Flat_Discount__c;
               }
               if(q.Discount_Type__c == 'Percentage Discount')
               {
                  q.Disounted_Bill__c = q.Amount__c - ((q.Amount__c* q.Percentage_Discount__c)/100);
               }
                system.debug('Discount Bill field:'+q.Disounted_Bill__c); 
     }
    }
}