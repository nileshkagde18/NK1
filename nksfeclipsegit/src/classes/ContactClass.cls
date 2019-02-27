public class ContactClass {
public static void mycon(id accid)
{
    list<contact> conlist= new list <contact>();
    for (integer i=0;i<5;i++)
    {
        Contact con = new Contact();
        con.LastName ='myContact'+i;
        con.Phone= '565865'+i;
        con.AccountId = accid;
        conlist.add(con);
     }
    insert conlist;
    system.debug('insertContact'+conlist);
}
}