public class class1 {  
    public static void insertAcc()
    { 
        List <Account> acclist = new List <Account>();
        for (integer i=0;i<3;i++)
        {
        account acc= new account();
        acc.Name='Infosys'+i;
        acc.Phone='020-4578454'+i;
        acc.Site='Pune'+i;
            ID ac = acc.Id;
        acclist.add(acc);
        }
        insert acclist;
        System.debug('	Inserted Account:'+acclist);
        //edition done in eclipse
        //hello by eclipse
    }       
}