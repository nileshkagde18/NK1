public class s_class Implements Schedulable 			//s_class as Schedulable class 
{
	public void execute(SchedulableContext Con)
    {
        Account b= new Account (name='Schedulable Account');	//craete account record
        insert b;												//Insert account
    }                 
}