public with sharing class ExercisesOnMap {
    //in ra gía trị theo cú pháp key => value
    public  void getMapKeyValue(Map<string,Integer> newMap) {
        for(String key : newMap.keySet()){
            Integer value = newMap.get(key);
            system.debug(key + '=>' + value);
        }
    } 
    
    // in ra key có value lớn nhất và nhỏ nhất
    public  void getMaxAndMinValueInMap(Map<string,Integer> newMap){
        List<Integer> listValueMap = newMap.values();
        Integer maxValue = listValueMap[0];
        Integer minValue = listValueMap[0];
        
        string maxKey;
        string minKey;
        for(Integer value : listValueMap)  {
            if(maxValue < value){
                maxValue = value;
                continue;
            }
            else {
                if(minValue > value){
                    minValue = value;
                    continue;
                }
            }
        }      
        for(String key : newMap.keySet()){
            Integer value = newMap.get(key);
            if(value == maxValue){
                maxKey = key;
            }
            else if(value == minValue){
                minKey = key;
            }
            else {
                continue;
            }
        }
        
        system.debug('Key có giá trị lớn nhất là: ' + maxKey);
        system.debug('Key có giá trị nhỏ nhất là: ' + minKey);

    }
    //tìm ra value của key 'opportunity'
    public  void getValueOfKeyOpportunity(Map<string,Integer> newMap) {
        for(String key : newMap.keySet()){
            if(key == 'Opportunity'){
                integer value = newMap.get(key);
                system.debug('value của Key "Opportunity" là: ' + value);
                break;
            }
        }
   }
}