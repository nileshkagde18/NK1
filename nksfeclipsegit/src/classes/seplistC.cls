public class seplistC {
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
}