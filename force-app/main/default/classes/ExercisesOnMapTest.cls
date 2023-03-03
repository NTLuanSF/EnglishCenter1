@istest
public with sharing class ExercisesOnMapTest {

    @istest
    public static void getMapKeyValueTest(){
        Map<String , integer> newMap = new Map<String , integer>(); 
        newMap.put('Opportunity',10); 
        newMap.put('Account',20); 
        newMap.put('Contact',15); 
        newMap.put('Case',40);
        ExercisesOnMap eco = new ExercisesOnMap();
        eco.getMapKeyValue(newMap);
    }
    @istest
    public static void getMaxAndMinValueInMapTest(){
        Map<String , integer> newMap = new Map<String , integer>(); 
        newMap.put('Opportunity',10); 
        newMap.put('Account',20); 
        newMap.put('Contact',15); 
        newMap.put('Case',40);
        ExercisesOnMap eco = new ExercisesOnMap();
        eco.getMaxAndMinValueInMap(newMap);
    }
    @istest
    public static void getValueOfKeyOpportunityTest(){
        Map<String , integer> newMap = new Map<String , integer>(); 
        newMap.put('Opportunity',10); 
        newMap.put('Account',20); 
        newMap.put('Contact',15); 
        newMap.put('Case',40);
        ExercisesOnMap eco = new ExercisesOnMap();
        eco.getValueOfKeyOpportunity(newMap);
    }
}