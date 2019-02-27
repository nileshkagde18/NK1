public class seplistB {
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
}