public class seplistA {
     public static void insertacc()		//insert method
    {
        list <Account>acclist = new list <Account>();		//Empty Account list
        for (integer i=0;i<3; i++)
        {
        account acc =new account();		//account object creation
        acc.Name='Congnizant'+i;
        acc.Site='Pune'+i;
        acc.Phone='020-56487956'+i;
     
        acclist.add(acc);				//add object to list
        }
        insert acclist;					//insert object
        system.debug('inserted account list:'+acclist);
     
        seplistB.insertcon(acclist);			// call method2 of class seplistB- insertcon- className.methodName(parameter passing)
        seplistC.insertopty(acclist);		// call method3- insertopty -className.methodName(parameter passing)
     	seplistD.deleteacc(acclist);
    } 
}