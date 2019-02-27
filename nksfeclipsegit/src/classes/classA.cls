public class classA {
 public static ID acid;		//static variable
    public static void insertacc()		//insert method
    {
        account acc =new account();		//new object creation
        acc.Name='Infosys';
        acc.Site='Pune';
        acc.Phone='020-56487956';
        insert acc;			//insert object
        system.debug('inserted account:'+acc);
        ID acid = acc.Id;		// pass ID into variable
        system.debug('acid:'+acid);
        insertcon( acid);		// call method2- insertcon- contact
        insertopty( acid);		// call method3- insertopty -opportunity
     //   return acid;
    } 
    
    public static void insertcon(ID acid)		//method 2 insert contact
    {
        system.debug('id inside contact:'+acid);		
        contact con =new contact();		//object creation
        con.AccountId= acid;		//passing ID of account to contact 'Account Name'
        con.LastName='nitin';
        con.Phone='848492';
        con.Email='nil@kagde.com';
        insert con;				//insert contact
        system.debug('inserted contact:'+con);
    }    
    
    public static void insertopty(ID acid)		//method 3 insert opportunity
    {
        system.debug('id inside Opportunity:'+acid);		
        Opportunity opty =new Opportunity();		//object creation
        opty.AccountId= acid;				//passing ID of account to opprotunity 'Account Name'
        opty.Name='Infosys 100 Laptops';
        opty.StageName='closed loss';
		opty.CloseDate= date.today();
        insert opty;				//insert contact
        system.debug('inserted Opportunity:'+opty);
    }    
}