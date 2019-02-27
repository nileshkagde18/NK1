public virtual class sepA {
    public static ID   acid;		//static variable
    public static void insertacc()		//insert method
    {
        list <account>acclist =new list <account>();
        for (integer i=0; i<1;i++)
        {
        account acc =new account();		//new object creation
        acc.Name='Congnizant';
        acc.Site='Pune';
        acc.Phone='020-56487956';
            acclist.add(acc);
        }
        insert acclist;					//insert object
        system.debug('inserted account list:'+acclist);
       id acid = acclist[0].id;			// pass ID into variable
        system.debug('acid in acc:'+acid);
     //   sepB.insertcon( acid);			// call method2- insertcon- className.methodName()
      //  sepC.insertopty( acid);		// call method3- insertopty -className.methodName()
     //   return acid;
  /*  } 
    public static void insertcon(list <account> acclist)			//method 2 insert contact
    {
      
       // sepA.insertacc();
        system.debug('id inside contact:'+acclist);	
          acid = acclist[0].id;
        system.debug('id inside contact:'+acId);		

        List <Contact> conlist = new list <contact>();	//Empty List
        for (account ac:acclist)						//create 3 contacts
        {
        contact con =new contact();		//object creation
        con.AccountId= ac.id;		//passing ID of account to contact 'Account Name'
        con.LastName='Yadav';
        con.Phone='778844554';
        con.Email='nil@kagde.com';
        
        conlist.add(con);			//adding con object into empty list
        }
        insert conlist;				//insert conlists
        system.debug('inserted contact list:'+conlist);
    } */
    } }