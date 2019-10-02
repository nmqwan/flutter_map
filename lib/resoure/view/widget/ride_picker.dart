import 'package:flutter/material.dart';
import 'package:taxi_app/resoure/model/place.dart';
import 'package:taxi_app/resoure/view/widget/ride_picker_page.dart';

class RidePicker extends StatefulWidget {
  final Function(Place, bool) onSelected;

  RidePicker(this.onSelected);

  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  Place toPlace, fromPlace;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
          ]),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          RidePickerPage((place, isFrom) {
                            widget.onSelected(place,isFrom);
                            toPlace=place;
                          }, false)));
                },
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Image.asset("ic_location_black.png"),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Image.asset("ic_remove_x.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          toPlace!=null ?toPlace.name:'',
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(fontSize: 16, color: Color(0xff323643)),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RidePickerPage((place,isFrom){
                        widget.onSelected(place,isFrom);
                        fromPlace=place;
                      },true)));
                },
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 40,
                        child: Center(child: Image.asset('ic_map_nav.png')),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        height: 50,
                        width: 40,
                        child: Center(child: Image.asset('ic_remove_x.png')),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          fromPlace!=null?fromPlace.name:'',
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(fontSize: 16, color: Color(0xff323643)),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
