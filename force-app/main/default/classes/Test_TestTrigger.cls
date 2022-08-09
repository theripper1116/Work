@isTest
private with sharing class Test_TestTrigger {
    @isTest
    private static void testFunction() {
        Account acc = new Account(
            Name = 'Burlington Textiles Corp of America',
            Rating = 'Warm'
        );
        insert acc;
        Account acc1 = New Account(
            Name = 'Burlington Textiles Corp of America',
            Rating = 'Warm' 
        );
        Test.startTest();
        insert acc1;
        Test.stopTest();
    }
}