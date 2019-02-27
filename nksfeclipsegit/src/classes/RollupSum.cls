public class RollupSum {
//Method 1- Child1: Add_Sum_Method
    public static void Add1(list<Child1__c> c1list)
    {
        set<string>ParentIdset = new set <string>();
        for (Child1__c ch1 : c1list)
        {
            if (ch1.Parent__c != null)
            {
               ParentIdset.add(ch1.Parent__c);
            }
        }
        system.debug('Parent Id:'+ParentIdset);
        list<Parent__c> Parentlist =[select id,name,Sum_of_Childs__c,Count_of_Childs__c,(select id,Amount1__c from Child1s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent List:'+Parentlist);
    
        for (Parent__c par: Parentlist)
        { 
       //     decimal sum=0;
          decimal sum;
          for (Child1__c obj1:par.Child1s__r)  // itrate loop for all relative records
          {
         //     sum+= obj1.Amount1__c;
           sum= par.Sum_of_Childs__c;
           }
          par.Sum_of_Childs__c = sum;                           
        }
    Update Parentlist; 
	}
  //Method 2- Child1: Sub_Sum_Method
    public static void Sub1(list<Child1__c> c1list)
    {
        set<string>ParentIdset = new set <string>();
        for (Child1__c ch1 : c1list)
        {
            if (ch1.Parent__c != null)
            {
               ParentIdset.add(ch1.Parent__c);
            }
        }
        system.debug('Parent Id:'+ParentIdset);   //
        list<Parent__c> Parentlist =[select id,name,Sum_of_Childs__c,Count_of_Childs__c,(select id,Amount1__c,name from Child1s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent List:'+Parentlist);
    
        for (Parent__c par: Parentlist)
        { 
            decimal sub;
          for (Child1__c obj1:par.Child1s__r)  // itrate loop for all relative records
          {
           //   sub-= obj1.Amount1__c;
        	sub= par.Sum_of_Childs__c- obj1.Amount1__c;      
          }
          par.Sum_of_Childs__c = sub;                                    
        }
    Update Parentlist; 
	}    
    
 //Method 3- Child2: Add_Sum_Method
    public static void Add2(list<Child2__c> c2list)
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
        list<Parent__c> Parentlist =[select id,name,Sum_of_Childs__c,Count_of_Childs__c,(select id,Amount2__c from Child2s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent List:'+Parentlist);
    
        for (Parent__c par: Parentlist)
        { 
            decimal sum;
          for (Child2__c obj2:par.Child2s__r)  // itrate loop for all relative records
          {
          //    sum+= obj2.Amount2__c;
              sum= par.Sum_of_Childs__c + obj2.Amount2__c;
          }
          par.Sum_of_Childs__c = sum;                           
        }
    Update Parentlist; 
	} 

//Method 4- Child2: Sub_Sum_Method
    public static void Sub2(list<Child2__c> c2list)
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
        list<Parent__c> Parentlist =[select id,name,Sum_of_Childs__c,Count_of_Childs__c,(select id,Amount2__c from Child2s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent List:'+Parentlist);
    
        for (Parent__c par: Parentlist)
        { 
            decimal sub;
          for (Child2__c obj2:par.Child2s__r)  // itrate loop for all relative records
          {
           //   sum+= obj1.Amount1__c;
              sub= par.Sum_of_Childs__c - obj2.Amount2__c;
          }
          par.Sum_of_Childs__c = sub;                           
        }
    Update Parentlist; 
	} 
    
    
 //Method 5- Child1: Update_Sum_Method
 /*   public static void update1(list<Child1__c> c1list)
    {
        set<string>ParentIdset = new set <string>();
        for (Child1__c ch1 : c1list)
        {
            if (ch1.Parent__c != null)
            {
               ParentIdset.add(ch1.Parent__c);
            }
        }
        system.debug('Parent Id:'+ParentIdset);
        list<Parent__c> Parentlist =[select id,name,Sum_of_Childs__c,Count_of_Childs__c,(select id,Amount1__c,name from Child1s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent List:'+Parentlist);
    
        for (Parent__c par: Parentlist)
        { 
            decimal updata=0;
          for (Child1__c obj1:par.Child1s__r)  // itrate loop for all relative records
          {
       //   sub-= obj1.Amount1__c;
        //	sub= par.Sum_of_Childs__c- obj1.Amount1__c;      
        updata += obj1.Amount1__c;
          }
          par.Sum_of_Childs__c = updata;                                    
        }
    Update Parentlist; 
	}	
    
 //Method 6- Child2: Update_Sum_Method
    public static void update2(list<Child2__c> c2list)
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
        list<Parent__c> Parentlist =[select id,name,Sum_of_Childs__c,Count_of_Childs__c,(select id,Amount2__c from Child2s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent List:'+Parentlist);
    
        for (Parent__c par: Parentlist)
        { 
           decimal d1 = par.Sum_of_Childs__c; decimal d2; decimal d3;
           system.debug('d1='+d1);
             decimal updata=0;
          for (Child2__c obj2:par.Child2s__r)  // itrate loop for all relative records
          {
          //    sum+= obj2.Amount2__c;
          //    sum= par.Sum_of_Childs__c + obj2.Amount2__c;
         //	updata += obj2.Amount2__c;
          d1-=  obj2.Amount2__c;
              system.debug('for loop d1='+d1);  }
           for (Child2__c obj2:par.Child2s__r)  // itrate loop for all relative records
          {   
          d1 += obj2.Amount2__c;
              system.debug('for d1='+d1);  }
          
        //  par.Sum_of_Childs__c = par.Sum_of_Childs__c + updata;    
         par.Sum_of_Childs__c = d1; 
             system.debug('ouside for d1='+d1);
        }
    Update Parentlist; 
	}    */
    
//Method 7-test- Child1: Update_Sum_Method
    public static void update1( list<Child1__c> c1list)
    {
        set<string>ParentIdset = new set <string>();
        for (Child1__c ch1 : c1list)
        {
            if (ch1.Parent__c != null)
            {
               ParentIdset.add(ch1.Parent__c);
            }
        }
        system.debug('Parent Id:'+ParentIdset);
        list<Parent__c> Parentlist =[select id,name,Sum_of_Childs__c,Count_of_Childs__c,
                                     (select id,Amount1__c from Child1s__r),
                                     (select id,Amount2__c from Child2s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent List:'+Parentlist);
    
        for (Parent__c par: Parentlist)
        { 
          decimal updata=0;
           for (Child1__c obj1:par.Child1s__r)  // itrate loop for child 1 records
           {
              updata += obj1.Amount1__c; 
           }
          for (Child2__c obj2:par.Child2s__r)  // itrate loop for child 2 records
          { 
       		 updata += obj2.Amount2__c;
          }
          par.Sum_of_Childs__c = updata;
        }
    Update Parentlist; 
	} 
    
//Method 8-test- Child2: Update_Sum_Method
    public static void update2( list<Child2__c> c2list)
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
        list<Parent__c> Parentlist =[select id,name,Sum_of_Childs__c,Count_of_Childs__c,
                                     (select id,Amount1__c from Child1s__r),
                                     (select id,Amount2__c from Child2s__r)
                                    from Parent__c where id in:ParentIdset];
       
        system.debug('Parent List:'+Parentlist);
    
        for (Parent__c par: Parentlist)
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
    Update Parentlist; 
	}    
}