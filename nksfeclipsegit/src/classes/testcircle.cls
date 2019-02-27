@isTest
public class testcircle 
{ 
    static testmethod void circletest()
    {
      //  circle c = new circle();
//system.assertEquals(0, c.a);
      //  system.assertEquals(0, c.b);
       // system.assertEquals(0, c.k);
       // system.assertEquals(null, c.b1);
       // system.assertEquals(null, c.s1);
     //   c.show();
       // system.debug('c:'+c);
        circle c = new circle(5,5);
        system.assertEquals(6, c.a);
        system.assertEquals(5, c.b);
        system.assertEquals(null, c.k);
       system.assertEquals(null, c.b1);
        system.assertEquals(null, c.s1);
      // c.show();
     	system.debug('c1:'+c);
    }
}