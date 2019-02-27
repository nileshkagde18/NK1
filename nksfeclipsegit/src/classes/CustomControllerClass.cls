Public class CustomControllerClass {

    list <Account> acts =[select name,type,industry,phone,fax from Account where industry='Banking'];  
    list <Account> acts2 =[select name,type,industry,phone,fax from Account where industry='Education'];
    
    //Methods to return these lists
    Public list<Account> getacts() {
    return acts;
    }
    
    Public list<Account> getacts2() {
    return acts2;
    }
}