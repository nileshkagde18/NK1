public class q_class2  implements Queueable                //q_class2 as Queueable class
{
    public static void execute (QueueableContext Con)           //Void Execute Method
    {
        Account c = new Account(Name='Queueable Contact');      //create Contact record
        insert c;                                               //Insert Contact record
     }                                                  
}