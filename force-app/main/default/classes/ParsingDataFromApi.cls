public with sharing class ParsingDataFromApi {
    //lấy dữ liệu từ json và parsing data sang UserWrapper class
    public static void GetDataFromApi(){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/posts');
        request.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            List<UserWrapper> exampleObject = (List<UserWrapper>)JSON.deserialize(responseBody, List<UserWrapper>.class);
            system.debug(exampleObject[0].userId);
        }
    }
}