public class childparentupdate {
   /* public static void parupdate(list<Child1__c>ch1list)
    {
       list<Child1__c>ch1list1=[SELECT Id,Name,Amount1__c,Email__c,Phone_No__c,
                                Parent__r.Id,Parent__r.Address__c
                                FROM Child1__c WHERE Id =:ch1list];
       list<parent__c>parlist= new list<parent__c>();
       set<id>parid= new set<id>();    
        for(Child1__c c:ch1list1)
        {
 	        parid.add(c.Parent__r.Id);
        }
        list<parent__c> parlist1=[select id,name,Address__c,(select Email__c,Phone_No__c from child1s__r),
                                   (select ch2phone__c from child2s__r)
                                  from parent__c where id in:parid];
        list<child2__c> ch2list= new list<child2__c>();  string abc;
        for(parent__c pa: parlist1)
        {
            for(child1__c ch1:pa.child1s__r)
            {
                if(ch1.Email__c != null)
                 {
                    pa.Address__c='Mumbai'; abc='true'; 
					system.Debug('par address:'+pa.Address__c);
                   }  }
            for(child2__c ch2:pa.child2s__r)
            {	
               if (abc=='True')
               {
                 ch2.ch2phone__c='858585';  
                 ch2list.add(ch2); 
                 system.debug('ch2 phone:'+ch2.ch2phone__c);
               }  
            }  }
          update ch2list;      
        update parlist1; 
        system.debug('update parent:'+parlist1); system.debug('update ch2'+ch2list);
    }   
    ======================================================================  */
    
    public  void childupdate(list<Child1__c>ch1list)
    {
       list<Child1__c>ch2list= [SELECT Id,Name,Parent__c,Amount1__c,Email__c,Phone_No__c
                                 FROM Child1__c WHERE Id in:ch1list];
        list<Child1__c>ch3list = new list<Child1__c>();
        boolean a= true;
        if (a== true){
        for(child1__c ch:ch2list)
        {
            if(ch.Amount1__c != null)
            {
                ch.Phone_No__c ='454545';
            }
            if(ch.Amount1__c == null)
            {
                ch.Phone_No__c ='111111';
            } 
            system.debug('inside for phone:'+ch.Phone_No__c); 
            ch3list.add(ch);
          } 
        system.debug('outside for ch2list:'+ch2list);  
            update ch3list;
          a=false;} 
      }    
}