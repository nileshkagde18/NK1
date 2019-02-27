public class classB {
	public static void insertcon(ID acid)
    {
        system.debug('id:'+acid);
        contact con =new contact();
        con.AccountId= acid;
        con.LastName='nilesh';
        con.Phone='848492';
        insert con;
        system.debug('inserted contact:'+con);
    }
}