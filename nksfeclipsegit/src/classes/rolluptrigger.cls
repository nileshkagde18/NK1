public class rolluptrigger {
    //Method 1- Child1: Add_Count_Method
    public static void CountAdd1(list<Child1__c> c1list)
    {
        system.debug('c1list:'+c1list);
        set<string>ParentIdset = new set <string>();
        for (Child1__c ch1 : c1list)
        {
            if (ch1.Parent__c != null)
            {
               ParentIdset.add(ch1.Parent__c);
            }
        }
        system.debug('Parent Id:'+ParentIdset);
        list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c,(select id from Child1s__r)
                                    from Parent__c ]; //where id in:ParentIdset  
        
   /*   list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c
                                    from Parent__c where id in:ParentIdset]; 
        
        list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c,(select id from Child1s__r)
                                   from Parent__c where id in:ParentIdset];  */
        
        system.debug('Parent List:'+ Parentlist);
        for (Parent__c par: Parentlist)
        {
           par.Count_of_Childs__c ++  ;  // = par.Child1s__r.size(); 
        system.debug('count:'+ par.Count_of_Childs__c);
            // par.Count_of_Childs__c += par.Child1s__r.size(); 
        }
 
        Update Parentlist; 
        system.debug('Parent List after Update:'+ Parentlist);
	}
// Method 2- Child1: Delete_Count_Method
    public static void CountDelete1(list<Child1__c> c1list)
    {
        system.debug('c1list in delete:'+c1list);
        set<string>ParentIdset = new set <string>();
        for (Child1__c ch1 : c1list)
        {
            if (ch1.Parent__c != null)
            {
               ParentIdset.add(ch1.Parent__c);
            }
        }
        system.debug('Parent Id in delete:'+ParentIdset);
        list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c,(select id,name from Child1s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent list in delete:'+ Parentlist);
        for (Parent__c par: Parentlist)
        {
            par.Count_of_Childs__c -- ;  //= par.Child1s__r.size(); 
            system.debug('count in delete'+par.Count_of_Childs__c);
        }
    Update Parentlist; 
        system.debug('Updated parent list in delete:'+Parentlist);
}
    
    // Method 3- Child2: Add_Count_Method
    public static void CountAdd2(list<Child2__c> c2list)
    {
        set<string>ParentIdset = new set <string>();
        for (Child2__c ch2 : c2list)
        {
            if (ch2.Parent__c != null)
            {
               ParentIdset.add(ch2.Parent__c);
            }
        }
        system.debug('Parent Id:'+ParentIdset);
        list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c    //,(select id from Child2s__r)
                                    from Parent__c where id in:ParentIdset];
        for (Parent__c par: Parentlist)
        {
            par.Count_of_Childs__c ++;   //= par.Child2s__r.size(); 
        }
    Update Parentlist; 
}
    // Method 4- Child2: Delete_Count_Method
     public static void CountDelete2(list<Child2__c> c2list)
    {
        set<string>ParentIdset = new set <string>();
        for (Child2__c ch2 : c2list)
        {
            if (ch2.Parent__c != null)
            {
               ParentIdset.add(ch2.Parent__c);
            }
        }
        system.debug('Parent Id:'+ParentIdset);
        list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c,(select id from Child2s__r)
                                    from Parent__c where id in:ParentIdset];
        for (Parent__c par: Parentlist)
        {
            par.Count_of_Childs__c --;   //= par.Child2s__r.size(); 
        }
    Update Parentlist; 
}
}     

/*  for (Parent__c par: Parentlist)
        { 
          decimal updata=0;
           for (Child1__c obj1:par.Child1s__r)   //itrate loop for child 1 records
           {
              updata += obj1.Amount1__c; 
           }
          for (Child2__c obj2:par.Child2s__r)   //itrate loop for child 2 records
          { 
       		 updata += obj2.Amount2__c;
          }
          par.Sum_of_Childs__c = updata;
        }   


//Method 1- Child1: Add_Count_Method
    public static void CountAdd1(list<Child1__c> c1list)
    {
        system.debug('c1list:'+c1list);
        set<string>ParentIdset = new set <string>();
        for (Child1__c ch1 : c1list)
        {
            if (ch1.Parent__c != null)
            {
               ParentIdset.add(ch1.Parent__c);
            }
        }
        system.debug('Parent Id:'+ParentIdset);      
      list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c,Sum_of_Childs__c,
                                   (select id,Amount1__c from Child1s__r),
                                   (select id,Amount2__c from Child2s__r)
                                    from Parent__c where id in:ParentIdset]; 
        
    //    list<Parent__c> Parentlist =[select id,name,Count_of_Childs__c,(select id from Child1s__r)
    //                                from Parent__c where id in:ParentIdset]; 
        system.debug('Parent List:'+ Parentlist);
        for (Parent__c par: Parentlist)
        {
          decimal updata=0;
           for (Child1__c obj1:par.Child1s__r)   //itrate loop for child 1 records
           {
              updata += obj1.Amount1__c; 
               system.debug('update in child1:'+updata);
               system.debug('amount in child1:'+obj1.Amount1__c);
           }
          for (Child2__c obj2:par.Child2s__r)   //itrate loop for child 2 records
          { 
       		 updata += obj2.Amount2__c;
              system.debug('update in child2:'+updata);
               system.debug('amount in child2:'+obj2.Amount2__c);
          } 
          par.Sum_of_Childs__c = updata; 
          system.debug('sum of child on parent:'+par.Sum_of_Childs__c);  
        }
         Update Parentlist; 
        system.debug('Parent List after Update:'+ Parentlist);
	}  
        }   */