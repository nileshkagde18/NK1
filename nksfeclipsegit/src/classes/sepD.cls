public class sepD {
    public static void deleteacc(Id acid)
    {
        system.debug('id inside Delete:'+acid);
      account acc = new account ();
        acc.Id= acid;
        system.debug('acc id to be deleted:'+acc.Id);
        delete acc;
        system.debug('acc deleted:'+acc);
    }

}