trigger Ch2_SumTrigger on Child2__c ( after insert, after update, after delete)  // Trigger on Child2
{
    if ((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isAfter))  //for insert, update
//   if (Trigger.isInsert && Trigger.isAfter)  // for Insert of records in Child2
    {
        CountSum.Count2(Trigger.new);     //Call Updated2 method 
    }
    if ((Trigger.isDelete && Trigger.isAfter )||(Trigger.isUndelete && Trigger.isAfter ))   //for delete
    {
        CountSum.Count2(Trigger.old);
    }    
 /*   if (Trigger.isUpdate && Trigger.isAfter)        //for update
    {
        CountSum.Count2(Trigger.new);
    }   */
}