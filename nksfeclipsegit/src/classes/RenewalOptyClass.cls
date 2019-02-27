public with sharing class RenewalOptyClass {
    
//Method1: End date calculation method
Public static void calculateEndDate( List<Opportunity> opList )
{
	for(Opportunity op :opList)
	{
			//conversion of Contract_Term( DataType: Double ) into Integer
	op.End_Date__C= op.Start_Date__c.addMonths(Integer.valueof(op.Term__c)); 
	} 		//End of for ( Opportunity op : opList )
} 		//End of Method1: End date calculation method

//Method2: Creation of Renewal opportunity
public static void createRenewOpty( List<Opportunity> opList )
{
	List<Opportunity> renewOptyList = new List<Opportunity>();	//Empty list
	Opportunity renewOpty = new Opportunity();					//new object
	List<OpportunityLineItem> prodList = new List<OpportunityLineItem> ();	//Empty list
												// Id originalOptyId;
	for( Opportunity op : opList )
	{
	system.debug('Renew Counter' + op.RenewCounter__c);
	if(op.RenewCounter__c!=null)
	renewOpty.RenewCounter__c = op.RenewCounter__c + 1; 
	else
	renewOpty.RenewCounter__c =1; 
	system.debug('Renew Counter is'+ renewOpty.RenewCounter__c);
	if ((op.opType__c =='Renew'||op.opType__c =='new') )
	{
			//&&op.End_Date__c==Date.newInstance(2018, 9, 19) 
	String temp = String.valueOf(renewOpty.RenewCounter__c );
	System.debug('temp'+ temp);
	Integer s=op.Name.length();
	String newName;
	if(op.Name.contains('renew'))
	newName =(op.Name ).substring(0,s-6);
	else
	newName=op.Name ;
	String name1= newName+'renew'+ renewOpty.RenewCounter__c;
	renewOpty.Name =name1;
	System.debug('If Typ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       e == Renew ::Renew Opty: ' + renewOpty.Name + 'Renew Opty Counter: ' + renewOpty.RenewCounter__c );
	if(op.OriginalOpportunity__c!=null)
	renewOpty.OriginalOpportunity__c = op.OriginalOpportunity__c;
	else
	renewOpty.OriginalOpportunity__c=op.Id;
	renewOpty.RenewOpportunity__c = op.Id;
	renewOpty.Term__c=12;

	renewOpty.AccountId = op.AccountId;
	renewOpty.CloseDate = Date.today();
	renewOpty.StageName = 'Prospecting';
	renewOpty.Start_Date__c = op.End_Date__c; 	//Start Date of the current opty should be one more than 
			//End Date of it's previous Opty
	renewOpty.End_Date__c= op.End_Date__c + 365;
	renewOpty.opType__c = 'Renew'; //set type of renew opty as Renew
	system.debug('Renew Opportunity is'+renewOpty);
	renewOptyList.add( renewOpty );
	}		//end of if
	} 		//end of for
	try
    {
	Insert renewOptyList; 
	System.debug( 'Renew Opty Inserted' );
	} 				// end of try
	Catch( exception e )
	{
	System.debug('Exception while inserting Renew Opty' + e );
	}				//end of catch
	copyProdList(opList, renewOptyList);		//call to Method3
	system.debug('Product copied');
} 		//End of Method2: Creation of Renewal opportunity

//Method3: Copy Product List	
public static void copyProdList( List<Opportunity> opList, List<Opportunity> renewOptyList )
{
	System.debug('Inside copyProdList()');
	System.debug('opList: '+opList);
	System.debug('renewOptyList: '+renewOptyList);
		//get list of products on immediate opty of Open Renew Opty
		// Copy products to Just inserted opty from its parent opty
	for(Opportunity rOpty : renewOptyList)
    {
	List<OpportunityLineItem> prodList = [SELECT id, OpportunityId, TotalPrice, ListPrice, UnitPrice, Quantity, PricebookEntryId
			 							  FROM OpportunityLineItem Where OpportunityId = :rOpty.RenewOpportunity__c];
	System.debug('Products List on:'+rOpty.Name+'Opty:'+ prodList);

    List<OpportunityLineItem> prList2 = new List<OpportunityLineItem>(); //empty list of opportunity products
	for(OpportunityLineItem pr : prodList)
    {
	OpportunityLineItem pr1 = new OpportunityLineItem();		//new object
	pr1.opportunityId = rOpty.Id;			 //products of Just inserted opty are referenced to its parent's Id.
	system.debug('pr1.OpId:'+pr1.OpportunityId);
	pr1.PricebookEntryId = pr.PricebookEntryId;
			//pr1.Name = pr.Name; //not Writable
	pr1.UnitPrice = pr.UnitPrice;
	pr1.Quantity = pr.Quantity;
		//pr1.TotalPrice = pr.TotalPrice; // We can either set unit price or total price but not both at a time
		//pr1.Product2Id = pr.Product2Id; //Not Writable
	system.debug('OppLine Item '+pr1);
	prList2.add(pr1);
	}
	try
    {
	Insert prList2;
	system.debug('ProductsList Inserted!!!');
	}
	catch(exception e)
    {
	System.debug('List insert Exception'+ e);
	}
	} 		//End of for
}		//End of Method3: Copy Product List

//Method4: Product insertion method
public static void createProductOnOpty(integer NumRecords,List<Opportunity> optylst)
{
	List<Product2> Prolst = new list<Product2>();			  //Empty list
	List<PricebookEntry> Pbelst= new list<PricebookEntry>();   //Empty list
	for(integer i=0;i<NumRecords;i++)
	{ 
	Product2 prd1 = new Product2 (); 		// ----> Create product
	prd1.Name='MY Jio'+i;
	prd1.ProductCode = 'Product-utf';
	prd1.Description = 'Product is Successfully added';
	prd1.IsActive = true;
	prolst.add(prd1); 
	}
	insert prolst;
	// List<product2> b=[select id from product2 where createddate=today];
	// delete b;
	system.debug('Add Product'+prolst);
	Pricebook2 standardPb = [select id, name, isActive from Pricebook2 where IsStandard = true limit 1]; 
	for(product2 pr :prolst)
	{
	PricebookEntry pbe1 = new PricebookEntry (); 		//------->Create PriceBookEntry
	pbe1.Product2ID=pr.id;
	pbe1.Pricebook2ID=standardPb.id;
	pbe1.UnitPrice=50;
	pbe1.isActive=true;
	pbelst.add(pbe1);
	}
	insert pbelst;
	//List<PricebookEntry> c=[select id from PricebookEntry where createddate=today];
	// delete c;
	system.debug('Add Pricebookentry'+pbelst);
	List<OpportunityLineItem> oplist=new List<OpportunityLineItem>(); //-->Create List to store OpportunityLineItem
			// List<opportunity> optylst=[select id ,name from opportunity limit 5]; 
	for(Opportunity opp: optylst)
	{ 
	if(opp.Name!=null && opp.OpType__c=='New')
	{
	for(pricebookentry pbe:pbelst)
	{
	OpportunityLineItem oppli = new OpportunityLineItem(); 		//---->Create OpportunityLineItem.
	oppli.PricebookEntryId= pbe.Id;
	oppli.OpportunityId = opp.Id;
	oppli.Quantity = 5;
//	oppli.TotalPrice = 10.0;
	oppli.TotalPrice = oppli.Quantity * pbe.UnitPrice;
	oppli.Product2Id=pbe.Product2Id;
	oplist.add(oppli);
	}			//end of pricebookentry for loop
	}			//end of if of opp.Name
	} 			//end of Opportunity for loop
	
    if(oplist!=null)
	{
	insert oplist; 			//----->insert OpportunityLineItem
	}
	// List<OpportunityLineItem> d=[select id from OpportunityLineItem where createddate=today];
	// delete d;
	system.debug('Add oli'+oplist); 
}	//end of Method4: Product insertion method  
}