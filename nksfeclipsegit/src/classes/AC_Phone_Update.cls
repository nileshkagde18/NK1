public class AC_Phone_Update    //Class
{  
// Method 1: to update contact phone with its account phone
    public static void PhoneUpdate (list<Account>aclist)
      {
        system.debug('aclist in method 1:'+aclist);		//list from Trigger.new
        list <Account> ac1list= [select id,name,Phone, 
                                 (select id,name,Phone,AccountId from Contacts)
                                 from Account where id =:aclist];   			//Relationship Query 
        list <Contact> con1list = new list <Contact> ();
        for (Account acc1:ac1list) 				//for loop for account list
        {
            for (Contact con:acc1.Contacts)		//for loop for Contacts
            {
                con.phone = acc1.Phone;			//assign account phone to contact phone
                con1list.add(con);				//add con object to list
            }
            update con1list;				//update con list
        }
    }
    
 // Method 2: to creat contact and opportunity when new account will be created.
    public static void CreatConOpp (list<Account>aclist)
      {
        system.debug('aclist in method 2:'+aclist);		//list from Trigger.new
 		list<Account> ac1list= [select id,name,Phone,
                                (select id,name,AccountID,Phone from Contacts),
                                (select id,name,AccountID,StageName from Opportunities)
                               from Account where id =: aclist];    //Relationship Query
		system.debug('ac1list after Query:'+ac1list);
        list<Contact> conlist = new list<Contact>();			//Empty Contact list
        list<Opportunity> opplist = new list<Opportunity>();	//Empty Opportunity list
        for (Account ac:ac1list)								//for loop for Account
        {
           contact con = new contact();		//create contact object
           con.LastName = ac.Name;
           con.AccountId = ac.id;
           con.Phone = ac.phone;
           conlist.add(con);			  //Create child contact and insert it    
           Insert conlist;
           system.debug('conlist :'+conlist);
           
           Opportunity opp = new opportunity ();		//create opportunity object
           opp.Name = ac.Name;
           opp.AccountId = ac.id;
           opp.StageName = 'Prospecting';
           opp.CloseDate = Date.today();
           opplist.add(opp);
           insert opplist;        				//Create child opportunity and insert it
           system.debug('opplist:'+opplist);   
        }
        }     
   
 // Method 3: to creat no of contacts entered in "no of contacts field" when new account will be created.
    public static void CreatConNO (list<Account>aclist)
      {
        system.debug('aclist in method 2:'+aclist);		//list from Trigger.new
 		list<Account> ac1list= [select id,name,Phone,No_of_Contacts__c,
                                (select id,name,AccountID,Phone from Contacts),
                                (select id,name,AccountID,StageName from Opportunities)
                               from Account where id =: aclist];    //Relationship Query
		system.debug('ac1list after Query:'+ac1list);
       
          list<Contact> conlist = new list<Contact>();			//Empty Contact list
 //       list<Opportunity> opplist = new list<Opportunity>();	//Empty Opportunity list
        for (Account ac:ac1list)								//for loop for Account
        {
             Decimal a = ac.No_of_Contacts__c;
            for (integer i=0; i<a; i++)
            {
           contact con = new contact();		//create contact object
           con.LastName = ac.Name;
           con.AccountId = ac.id;
           con.Phone = ac.phone;
           conlist.add(con);     
            }
           Insert conlist;					//Insert Contact list
           system.debug('conlist :'+conlist);
          }    
        }   
    
  //Method 4: After Updating account if old billing street not equal to new billing street
  // then update it child contact with other street equal to new billing street.  
	public static void ConStreetUp(list<Account> acnewlist, map<id,Account>map1)
    {
       system.debug('New Account list in Method4:'+acnewlist);
       system.debug('Old Account Map1 in Method4:'+map1);
       list<Account>aclist1 = [select id, name,phone,BillingStreet,
                               (select id,name,OtherStreet from Contacts)
                               from account where id=:acnewlist];
       system.debug('aclist1:'+aclist1); 
       list<Contact>conlist= new list <Contact>();
       for(account acc: aclist1)
       {
        system.debug('id from map:'+map1.get(acc.id).BillingStreet);
           if (map1.get(acc.id).BillingStreet != acc.BillingStreet)
           {
               for(Contact con:acc.Contacts)
               {
                   con.OtherStreet = acc.BillingStreet;
                   conlist.add(con);
               }
               update conlist;
           }
       }
    }        
    
  
 //Method 5:Future Method:(only Method is Future) Simple Add Account. 
 //Call it from anonomous window: AC_Phone_Update.addacc();
 @future 
    public static void addacc()
    {
        account ac = new account();		//creat account object
        ac.name='ABCD';
        ac.Phone= '441144';
        ac.Site='Pune';
        insert ac;			//insert account
    }     
}