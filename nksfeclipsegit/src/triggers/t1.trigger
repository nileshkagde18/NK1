trigger t1 on Account (before insert)
{
    for (Account a:Trigger.new)
    {
     if (a.industry=='Technology')
     {
       a.description='Technology Account';
     }  
    }
}