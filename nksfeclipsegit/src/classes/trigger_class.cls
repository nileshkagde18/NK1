public class trigger_class{
public static void check_opp(list<opportunity>ops)
{
    double total_Amount=0;
    for (opportunity o1: [select Amount from opportunity where createdDate= Today
                                                AND CreatedById= :UserInfo.getUserID()])
    {
        total_Amount += o1.Amount;
    }
    
    for (opportunity o2: ops)
    {
        total_Amount += o2.Amount;
     
    if (total_Amount >100000)
    o2.addError ('You have excedded daily limit of 100k');
    } 
  }
 }