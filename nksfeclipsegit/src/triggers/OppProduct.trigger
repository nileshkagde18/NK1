trigger OppProduct on OpportunityLineItem (After insert, before update)
{
	if (Trigger.isInsert && Trigger.isAfter) 
    {
        OppProductclass.OppProduct(Trigger.new);
    }
    
    if(Trigger.isUpdate && trigger.isBefore)
    {
        
        set<id>oppid=new set<id>();
        for(OpportunityLineItem op1: Trigger.new)
        {
            op1.Total_Discounted_Bill__c = op1.Quantity * op1.Unit_Discounted_Bill__c;
            oppid.add(op1.opportunityId);
        }
        list<opportunity>oplist= [select id, name,Net_Discounted_Bill__c,
                                  (select id,Total_Discounted_Bill__c from OpportunityLineItems)
                                 from opportunity where id in:oppid];
        list<opportunity>oplist1= new list<opportunity>();
        boolean a= true; if(a==true){
        for(opportunity op:oplist)
        {
            decimal tot=0;
            for(OpportunityLineItem op2:op.OpportunityLineItems)
            {
              tot = tot + op2.Total_Discounted_Bill__c;
            }
            op.Net_Discounted_Bill__c= tot;
            oplist1.add(op);
        }
       update oplist1;
       system.debug('Updated Opp list:'+ oplist1);   a=false; }
	}
}