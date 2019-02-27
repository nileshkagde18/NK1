public class sepC {
     public static void insertopty(ID acid)		//method 3 insert opportunity
    {
        system.debug('id inside Opportunity:'+acid);
        List <Opportunity> optylist = new list <Opportunity>();		//Empty Opportunity list
        for (integer i=0;i<3;i++)
        {
        Opportunity opty =new Opportunity();		//object creation
        opty.AccountId= acid;				//passing ID of account to opprotunity 'Account Name'
        opty.Name='10 PC'+i;
        opty.StageName='closed loss';
		opty.CloseDate= date.today();
        
        optylist.add(opty);				//adding opty object into list
        }
        insert optylist;				//insert optylist
        system.debug('inserted Opportunity list:'+optylist);
    }
}