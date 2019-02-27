public class class2 {
      public static void insertCon( ID ac)
      {
          list <Contact> conlist = new list <Contact> ();
          for (integer i=0;i<3;i++)
          {
          Contact con = new contact();
        //  con.AccountId= InfoID;
          con.LastName='Kale'+i;
          con.AssistantPhone='875641255'+i;
          con.AssistantName='priya'+i;
          conlist.add(con);
          }
          insert conlist;
          system.debug('	Contact Inserted:'+conlist);
       //   class1.insertAcc();
      }
}