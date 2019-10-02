import 'dart:async';

import 'package:taxi_app/resoure/repository/place_service.dart';

class RidePickerBloc{
  StreamController _ridePickerController = new  StreamController();
  Stream get ridePickerStream => _ridePickerController.stream;
  PlaceService placeService =new PlaceService();

  void searchPlace(String searchKey){
    _ridePickerController.sink.add('start');
    placeService.searchPlace(searchKey).then((data){
    _ridePickerController.sink.add(data);
    }).catchError((err){
    _ridePickerController.sink.add('err');
    });
  }

  void  dispose(){
    _ridePickerController.close();
  }
}