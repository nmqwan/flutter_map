import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/resoure/model/place.dart';
import 'package:taxi_app/resoure/view/widget/home_menu.dart';
import 'package:taxi_app/resoure/view/widget/ride_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  Map<String,Place> _makers= new Map();
  GoogleMapController _controller;

  Place toPlace,fromPlace;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(10.8620132, 106.644723), zoom: 15),
              onMapCreated: (GoogleMapController controller){
                _controller=controller;
              },
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                      "Taxi App",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: FlatButton(
                        onPressed: () {
                          print("click menu");
                          key.currentState.openDrawer();
                        },
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(
                          "ic_menu.png",
                        )),
                    actions: <Widget>[Image.asset("ic_notify.png")],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: RidePicker(onSelected),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }

  void onSelected(Place place,bool isFrom){
   String mkID =isFrom?'isFrom':'isTo';
   _makers.remove(mkID);
   print(place.toString() );
   print(mkID);
//   _controller.();
  }
}
