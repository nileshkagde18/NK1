public class getmethod {              		//Class
    list <Account> acts=[select name,type, industry from account limit 5];	//acts list of accounts
	public list<Account> getacts()		//get() method
    {
    string na= acts[0].name;				//Access list element
    system.debug('acts:'+na);
    return acts;
	}  
}

/* Anonymous Window:
 getmethod a= new getmethod();
list<Account> aclist= a.getacts();
system.debug('aclist:'+aclist);
*/