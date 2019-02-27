public class seplistD {
  public static void deleteacc(list <Account>acclist)
    {
       system.debug('Account inside Delete:'+acclist);
      list <Account>deletelist = acclist;				//copy account list inside delete list
        system.debug('Account to be Deleted:'+acclist);
        delete deletelist;
        system.debug('Account Deleted:'+acclist);
      }   
}