public class class4 {
	public static void deleteAcc()
    {
       	list <Account> deletelist = new list <Account>();
        list <Account> acclist = [select name, id from account where CreatedDate= Today];
        for(Account acc:acclist)
        {
            deletelist.add(acc);
        }
        delete deletelist;
        system.debug('deleted Account:'+acclist);
    }
}