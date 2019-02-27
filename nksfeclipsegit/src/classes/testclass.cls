@isTest  //use @isTest so that character of class will not count
         //Apex Total Class character limit is 3000000. so use @isTest anotation    
public class testclass
{
 static testmethod void test_method1()
 // @istest static void test_method1()
 {
   list<Account> acts = new list <Account> ();
   for(integer i=0; i<10; i++)
   {
    Account a = new account (name='Test Account'+i, industry='Technology');
    acts.add(a);
   }
   Test.StartTest(); //use start and stop test. So DML count will not consider.
   insert acts;      //Insert Dummy data for test. This will not insert in database 
   Test.StopTest();
   
   //Testing of Inserted Dummy data account to Trigger or class for which Test class is written
   list<Account>insert_acts = [select name,Industry, Description from Account where id in:acts];
   for (Account ac:insert_acts)
   {
    system.assertEquals('Technology Account', ac.Description);
   } 	//system.assertEquals will check (Expected value,Actual Value) of the field or variable
  }		//are Equal or Not Equal. If not equal error and code coverage will be less.
}