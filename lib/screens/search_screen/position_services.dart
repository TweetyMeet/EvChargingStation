import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class PositionServices{
  final String API_KEY ='';
  final String baseUrl ='https://maps.googleapis.com/maps/api/place';

  Future<String> getPlaceId(String searchInput) async{
       final String url ='$baseUrl?input=$searchInput&inputtype=textquery&key=$API_KEY';

       var response = await http.get(Uri.parse(url));
       var jsonResponse = convert.jsonDecode(response.body);
       var placeId = jsonResponse['candidates'][0]['place_id'] as String;
     //  print(jsonResponse);

       return  placeId;

  }
    Future<Map<String, dynamic>> getPlaceDetails(String place) async{

    final placeId = await getPlaceId(place);
    final String url = "$baseUrl/details/json?place_id=$placeId&key=API_KEY";
    var response = await http.get(Uri.parse(url));
    var jsonResponse = convert.jsonDecode(response.body);
    var placeDetails = jsonResponse['result'] as Map<String, dynamic>;

    return placeDetails;

   // print(jsonResponse);


    }
}