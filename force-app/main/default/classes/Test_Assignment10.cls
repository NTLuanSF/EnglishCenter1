@istest
public class Test_Assignment10 {
    @TestSetup
    public static void SetData(){
        //insert 200 account
        List<Case> testCase = new List<Case>();
        for(Integer i=0; i < 200; i++) {
            testCase.add(new Case(Subject = 'Test Case '+ i));
        }
        insert testCase;      
    }
    @istest
    public static void TestCountCase(){
        integer countCase = [SELECT Count() FROM Case];
        system.debug(countCase);
        System.Assert(countCase == 200, 'success !');
    }
}