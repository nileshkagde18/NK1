trigger Ch1_SumTrigger on Child1__c (after insert, before update, after update,after delete)
{
 /* if ((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isAfter))  //for insert, update
  if (Trigger.isInsert && Trigger.isAfter)
   {
        CountSum.Count1(Trigger.new);
    }
    if ((Trigger.isDelete && Trigger.isAfter )||(Trigger.isUndelete && Trigger.isAfter ))   //for delete
    {
        CountSum.Count1(Trigger.old);
    }
    
    if (Trigger.isUpdate && Trigger.isAfter)      //for update
    {
        CountSum.Count1(Trigger.old);
    }    
  
  if ((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isBefore))
  {
      childparentupdate.parupdate(trigger.new);
  }          */

    if((Trigger.isUpdate && Trigger.isBefore) || (Trigger.isInsert && Trigger.isBefore))
    {      
        list<Child1__c> acc=trigger.new;
        childparentupdate f=new childparentupdate();
        f.childupdate(acc);
     //   childparentupdate.childupdate(Trigger.new);  
 /*    for(Child1__c ch:Trigger.new)
      {
          if(ch.Amount1__c != null)
            {
                ch.Phone_No__c ='454545';
            }
            if(ch.Amount1__c == null)
            {
                ch.Phone_No__c ='111111';
            } system.debug('inside for phone:'+ch.Phone_No__c);
      }    */
    }
 }