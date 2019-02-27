global class batch_class implements Database.Batchable<sObject>  //Batch Class
{
	//IMP: All class, methods, Variables in Batch Apex should be GLOBAL
    global final string query;			//Final keyword used in Java for
    global final string s_object;		//declaring variable value as Constant.
    global final string field;			
    global final string field_value;
    
    global batch_class(string q,string s,string f,string v)		//Class Constructor 
    {
        query =q;
        s_object =s;
        field =f;
        field_value =v;
    }
    
    //1st Method: Start method of Batch Apex
    global Database.QueryLocator start (Database.BatchableContext BC)
    {
        return Database.getQueryLocator(query);
    }
    
    //2nd Method: Execute method of Batch Apex
   global void execute(Database.BatchableContext BC, list<sobject> batchlist)
   // global void Database.Batchable.execute(Database.BatchableContext BC, List<sobject> batchlist)
    {
        for (sobject o : batchlist)
        {
            o.put (field, field_value);		//put value given in that field
        }
        update batchlist;					//update list
    }
    
    //3rd Method: Finish method of Batch Apex
    global void finish (Database.BatchableContext BC)
    {
        
    }
}