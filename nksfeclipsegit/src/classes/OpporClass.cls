public class OpporClass {
public static void myopty(ID accid)
{
    list<opportunity> optylist =new list<opportunity>();
    for (integer i=0; i<5;i++)
    {
        opportunity opty= new opportunity();
        opty.name='myOppor'+i;
        opty.CloseDate=date.today();
        opty.StageName='closed own';
        opty.AccountId=accid;
        optylist.add(opty);
    }
    insert optylist;
    system.debug('insert opp'+optylist);
    }
}