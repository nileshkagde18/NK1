public class OppDuplicate
{
    public static void Duplicate(List<Opportunity> opplist)
    {
        list<string> na = new list <string>();
        for(opportunity op:opplist)
        {             
    list <opportunity> op1 = [select name from opportunity where name =:op.name];
    system.debug('op1 list:'+op1);
    system.debug('size of op1:'+op1.size());
            if(op1.size() > 0)
            { 
               op.addError('Duplicate Record');
            } 
        }   
    }
}