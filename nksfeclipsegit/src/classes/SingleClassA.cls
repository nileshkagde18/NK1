public class SingleClassA {
    // =========  Account Insert Method ========================= 
    public static void insertacc()		//insert method
    {
        list <Account>acclist = new list <Account>();		//Empty Account list
        for (integer i=0;i<3; i++)
        {
        account acc =new account();		//account object creation
        acc.Name='Cognizant'+i;
        acc.Site='Pune'+i;
        acc.Phone='020-56487956'+i;
     
        acclist.add(acc);				//add object to list
        }
        insert acclist;					//insert object
        system.debug('inserted account list:'+acclist);
     
        seplistB.insertcon(acclist);			// call method2 of class seplistB- insertcon- className.methodName(parameter passing)
        seplistC.insertopty(acclist);		// call method3- insertopty -className.methodName(parameter passing)
     	seplistD.deleteacc(acclist);
    } 
    // ============== Contact Insert Method ===================================  
    public static void insertcon(list <Account>acclist)			//method 2 insert contact
    {
       system.debug('list inside contact:'+acclist);			
        List <Contact> conlist = new list <contact>();		//Empty contact List
      //  list <Contact> accid = [select id from contact where accountid in: acclist];
    //   system.debug('account id list:'+accid);
        for (Account ac:acclist)						//create contacts
        {
        contact con =new contact();			//contact object creation
        con.AccountId=ac.id;				//passing ID of account to contact 'Account Name'
        con.LastName='Yadav';
        con.Phone='778844554';
        con.Email='nil@kagde.com';
        
        conlist.add(con);				//adding con object into contact list
        }
        insert conlist;					//insert conlists
        system.debug('inserted contact list:'+conlist);
    }
    // ================= Opportunity Insert Method =============================
    
    public static void insertopty(list <Account>acclist)		//method 3 insert opportunity
    {
        system.debug('list inside Opportunity:'+acclist);
        List <Opportunity> optylist = new list <Opportunity>();		//Empty Opportunity list
        for (Account ac:acclist)
        {
        Opportunity opty =new Opportunity();		//object creation
        opty.AccountId= ac.id;						//passing ID of account to opprotunity 'Account Name'
        opty.Name='10 PC';
        opty.StageName='closed loss';
		opty.CloseDate= date.today();
        
        optylist.add(opty);					//adding opty object into list
        }
        insert optylist;					//insert optylist
        system.debug('inserted Opportunity list:'+optylist);
    }
    // ================ Account record Delete method =======================================
    
    public static void deleteacc(list <Account>acclist)
    {
       system.debug('Account inside Delete:'+acclist);
      list <Account>deletelist = acclist;				//copy account list inside delete list
        system.debug('Account to be Deleted:'+acclist);
        delete deletelist;
        system.debug('Account Deleted:'+acclist);
      }
    // =====================================================================
}