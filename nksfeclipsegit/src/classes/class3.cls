public class class3 {
    public static void insertOpty() 
      //   public static void insertOpty(List <Account> acclist) 
    {
        List <Opportunity> optylist = new List <Opportunity>();
        for (integer i=0;i<3;i++)
        {
        Opportunity opty =new Opportunity();
       // opty.AccountId= InfoID;
        opty.Name='Infosys 100 Laptops'+i;
        opty.StageName='Closed Loss';
        opty.CloseDate= date.today();
        optylist.add(opty);
        }
        insert optylist;
        system.debug('	Opportunity Inserted:'+optylist);
      //  class1.insertAcc();
    }

}