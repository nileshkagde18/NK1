Public class ExtensionControllerClass       //Extension Class
{
    public ExtensionControllerClass (ApexPages.StandardController cont)
    {            
    }            //Constructor of Extension Class   
    
    list <Campaign> camps =[select name, description from Campaign];
    Public list<Campaign> getcamps()        
    {                                        //get method for camps
        return camps;
    }
}