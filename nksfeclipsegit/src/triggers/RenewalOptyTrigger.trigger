trigger RenewalOptyTrigger on Opportunity (before insert,before update,after update,after insert) 
{
    List<opportunity> oplist=new List<Opportunity>();
    if(trigger.isinsert && trigger.isafter)
    {
        // List<Opportunity> oplist1=;
    RenewalOptyClass.createProductOnOpty(2, [select id,name,opType__C from Opportunity where id IN:trigger.new]); 
    }           //call to Method4
    
    if((trigger.isinsert && trigger.isbefore)|| (trigger.isupdate && trigger.isbefore))
    {
    RenewalOptyClass.calculateEndDate(trigger.new);     //call to Method1
    } 
    
    if(trigger.isupdate && trigger.isafter) 
    { 
    for(Opportunity opp : trigger.new)
    {
    //get old values of updated opportunities
    Opportunity oldopp=trigger.oldMap.get(opp.Id);
    if(oldopp.stageName=='Closed Won' && opp.StageName!='Closed Won')
    opp.StageName.addError('You cant chanage stage after closed won');
    if(opp.stageName!=oldopp.stagename && opp.StageName=='Closed Won')
    {
    RenewalOptyClass.createRenewOpty(trigger.new);      //call to Method2
    }
    }
    }
}