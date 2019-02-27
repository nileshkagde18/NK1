trigger count on Child1__c (after insert, after update, after delete)
{       
    if ((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isAfter))  //for insert
    {
        rolluptrigger.CountAdd1(Trigger.new);
    }
    
 /*   if (Trigger.isDelete && Trigger.isAfter )   //for delete
    {
        rolluptrigger.CountDelete1(Trigger.old);
    }    */
}