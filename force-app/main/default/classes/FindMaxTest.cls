@isTest
public class FindMaxTest {

    @isTest
    public static void findMaxTestMethod(){
        FindMax obj = new FindMax(3,10);
        obj.findMaximum();
        System.assertEquals(10, obj.c);
    }
     @isTest
    public static void findMaxTestMethod2(){
        FindMax obj = new FindMax(12,3);
        obj.findMaximum();
        System.assertEquals(10, obj.c);
    }
}