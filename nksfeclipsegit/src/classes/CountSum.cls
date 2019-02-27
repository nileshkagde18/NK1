public class CountSum {
// Method 1: Count, Sum for Child1 
    public static void Count1(list<Child1__c> c1list)   //Tigger.new/ Trigger.old for child1
    {
        system.debug('child1 input list:'+c1list);
        set<string>ParentIdset = new set <string>();
      
        for (Child1__c ch1 : c1list)					//For loop for selecting parent list
        {
            if (ch1.Parent__c != null)
            {
               ParentIdset.add(ch1.Parent__c);
            }
        }
      system.debug('Parent Id list for child1:'+ParentIdset);      
      
      list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c,Sum_of_Childs__c,
                                   (select id,Amount1__c from Child1s__r),
                                   (select id,Amount2__c from Child2s__r)
                                    from Parent__c where id in:ParentIdset];  //Parent Query for both childs
      system.debug('Parent List after Parent Query:'+ Parentlist);
        
        for (Parent__c par: Parentlist)   //For loop iteration over parent list
        {
          decimal coun=0;
          decimal sum=0;  
          for (Child1__c obj1:par.Child1s__r)   //itrate loop for child 1 records
           {
              coun++;							//increment count
              sum += obj1.Amount1__c; 			//Sum of Amount field from all records of child1
               system.debug('count in child1:'+coun);
               system.debug('amount in child1:'+obj1.Amount1__c);
           }
          for (Child2__c obj2:par.Child2s__r)   //itrate loop for child 2 records
          { 
       		 coun++;							//increment count
             sum += obj2.Amount2__c; 			//Sum of Amount field from all records of child2
               system.debug('count in child2:'+coun);
               system.debug('amount in child2:'+obj2.Amount2__c);
          } 
            par.Count_of_Childs__c = coun;		//Assign total count to Count_of_childs field of Parent
            par.Sum_of_Childs__c = sum; 		//Assign total sum of amount field to Sum_of_Child field of Parent
          system.debug('count of child records on parent:'+par.Count_of_Childs__c);  
          system.debug('sum of child records on parent:'+par.Sum_of_Childs__c);  
        }
         Update Parentlist; 			//Update Parent List
        system.debug('Parent List after Update:'+ Parentlist);
	}  

// Method 2: Count, Sum for Child2 
    public static void Count2(list<Child2__c> c2list)   //Tigger.new/ Trigger.old for child2
    {
        system.debug('child2 input list:'+c2list);
        set<string>ParentIdset = new set <string>();
       
        for (Child2__c ch2 : c2list)					//For loop for selecting parent list
        {
            if (ch2.Parent__c != null)
            {
               ParentIdset.add(ch2.Parent__c);
            }
        }
      system.debug('Parent Id list for child2:'+ParentIdset);      
      
      list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c,Sum_of_Childs__c,
                                   (select id,Amount1__c from Child1s__r),
                                   (select id,Amount2__c from Child2s__r)
                                    from Parent__c where id in:ParentIdset];  //Parent Query for both childs
     system.debug('Parent List after Parent Query:'+ Parentlist);
        
        for (Parent__c par: Parentlist)   //For loop iteration over parent list
        {
          decimal coun=0;
          decimal sum=0;  
          for (Child1__c obj1:par.Child1s__r)   //itrate loop for child 1 records
           {
              coun++;							//increment count
              sum += obj1.Amount1__c; 			//Sum of Amount field from all records of child1
               system.debug('count in child1:'+coun);
               system.debug('amount in child1:'+obj1.Amount1__c);
           }
          for (Child2__c obj2:par.Child2s__r)   //itrate loop for child 2 records
          { 
       		 coun++;							//increment count
             sum += obj2.Amount2__c; 			//Sum of Amount field from all records of child2
               system.debug('count in child2:'+coun);
               system.debug('amount in child2:'+obj2.Amount2__c);
          } 
            par.Count_of_Childs__c = coun;		//Assign total count to Count_of_childs field of Parent
            par.Sum_of_Childs__c = sum; 		//Assign total sum of amount field to Sum_of_Child field of Parent
          system.debug('count of child records on parent:'+par.Count_of_Childs__c);  
          system.debug('sum of child records on parent:'+par.Sum_of_Childs__c);  
        }
         Update Parentlist; 			//Update Parent List
        system.debug('Parent List after Update:'+ Parentlist);
	}  
}