@isTest
public class ArthemeticTest {
    
    @isTest
    Public static void addTest(){
        Integer addition = Arthemetic.add(10,20);
        Assert.areEqual(30,addition,'Unable to find value');
    }
    @isTest
    Public static void subtractTest(){
        Integer sub = Arthemetic.subtract(20,10);
        Assert.areEqual(10,sub,'Unable to find value');
    }
    @isTest
    Public static void multiplyTest(){
        Integer multiplication = Arthemetic.multiply(10,20);
        Assert.areEqual(200,multiplication,'Unable to find value');
    }
    @isTest
    Public static void divisionTest(){
        Integer divide = Arthemetic.division(10,2);
        Assert.areEqual(5,divide,'Unable to find value');
    }

}