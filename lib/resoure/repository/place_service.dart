import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taxi_app/resoure/model/place.dart';
import 'package:taxi_app/resoure/ultils/configs.dart';

class PlaceService {
  String urlPlace =
      'https://maps.googleapis.com/maps/api/place/textsearch/json?key=' +
          Configs.ggKEY2 +
          '&language=vi&region=VN&query=';

  Future<List<Place>> searchPlace(String name) async {
    String urlRequesr = urlPlace + Uri.encodeComponent(name);
    print(urlRequesr);
    var res = await http.get(urlRequesr);
    if (res.statusCode==200){
      List<Place> places =  Place.formatJson(json.decode(res.body));
      print(places);
      return places;
    }else{
      print('=========QWAN==========');
      return new List();
    }
  }
}
