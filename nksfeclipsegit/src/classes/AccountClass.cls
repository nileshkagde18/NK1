public class AccountClass {
public static void myacc()
{
    list<Account> acclst =new list <Account>();
    for (integer i=0; i<5; i++)
    {
        Account acc= new Account();
        acc.Name='myAccount'+i;
        acc.phone='884456674'+i;
        acc.Active__c='no';
        acclst.add(acc);
    }
    insert acclst;
    system.debug('insert account'+acclst);
}
}