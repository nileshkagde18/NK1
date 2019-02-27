trigger ConPhoneUpdate on Account ( /*after insert, */ before insert, before Update)  //for Insert & Update
{
/*	if (Trigger.isUpdate && Trigger.isAfter)  // for updating contact phone  
    {										  // after update of its parent Account phone
    AC_Phone_Update.PhoneUpdate(Trigger.new);    
    }
    
    if (Trigger.isInsert && Trigger.isAfter)   //for creating contact and opportunity 
    {										   //when new Account is created
    AC_Phone_Update.CreatConOpp(Trigger.new);    
    }    
    
    if (Trigger.isInsert && Trigger.isAfter)   //for creating no of contacts entered into account field 
    {										   //when new Account is created
    AC_Phone_Update.CreatConNO(Trigger.new);    
    }     
    
    if (Trigger.isUpdate && Trigger.isAfter)  //for updating Contact OtherStreet with  
    {										  //Account new BillingStreet if it get chaged 
    AC_Phone_Update.ConStreetUp(Trigger.new, Trigger.oldmap);    
    }  */   
}