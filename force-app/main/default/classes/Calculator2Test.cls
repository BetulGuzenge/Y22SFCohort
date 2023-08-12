//For each Class or Trigger we write different Test classes.
@isTest
public class Calculator2Test {
    //in each test class we will have multiple TEST METHODS.
        //each test method will TEST UNIT of our actual class
    //we can have NON-test method inside test class also.

    public static void show() {
        system.debug('a normal method inside a test class.'); //allowed? Yes
    }

    @isTest
    public static void testMethod1() {
        //PUBLIC test methods are ALLOWED.
        system.debug('testmethod 1 called.');
        Calculator2 c = new Calculator2();
        c.accept(4, 5);
    }

    @isTest
    private static void testMethod2() {
        //private test methods are ALLOWED.
        system.debug('testmethod 2 also called.');
        Calculator2 c = new Calculator2();
        c.accept(4, 5);
        c.getSummation();
    }
}