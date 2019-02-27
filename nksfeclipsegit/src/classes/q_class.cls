public class q_class implements Queueable                   //q_class as Queueable class
{
    public static void execute (QueueableContext Con)       //Void Execute Method
    {
        Account a = new Account(name='Queueable Account');  //create account record
        insert a;                                           //Insert Account record
               //call to 2nd Queueable class
    }  ID jobId2= System.enqueueJob(new q_class2());                                                     //called as Chaining of Queueable class
}