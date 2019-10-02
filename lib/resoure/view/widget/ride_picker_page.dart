import 'package:flutter/material.dart';
import 'package:taxi_app/resoure/blocs/ride_picker_bloc.dart';
import 'package:taxi_app/resoure/model/place.dart';
import 'package:taxi_app/resoure/repository/place_service.dart';

class RidePickerPage extends StatefulWidget {
  Function(Place, bool) onSelected;
  bool isFrom;
  @override
  _RidePickerPageState createState() => _RidePickerPageState();

  RidePickerPage(this.onSelected,this.isFrom);
}

class _RidePickerPageState extends State<RidePickerPage> {
  TextEditingController edtSearchController = new TextEditingController();
  RidePickerBloc ridePickerBloc = new RidePickerBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ridePickerBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Picker"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: Image.asset('ic_location_black.png'),
                        ),
                        Flexible(
                          child: TextField(
                            controller: edtSearchController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (text) {
                              ridePickerBloc.searchPlace(text);
                            },
                          ),
                        ),
                        FlatButton(
                          child: Image.asset('ic_remove_x.png'),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: StreamBuilder(
                    stream: ridePickerBloc.ridePickerStream,
                    builder: (context, snap) {
                      print(snap.data);
                      print('QQQQQQQQQQQQQQQQQQQQQQQQQQ');

                      if (snap.hasData && snap.data == 'start') {
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snap.hasData && snap.data == 'err') {
                        return Container(
                          child: Center(child: Text("eRrOr")),
                        );
                      }
                      List<Place> places = snap.data;
                      if (places == null) return Text('');
                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(places.elementAt(index).name == null
                                  ? ''
                                  : places.elementAt(index).name),
                              subtitle: Text(
                                  places.elementAt(index).addrs == null
                                      ? ''
                                      : places.elementAt(index).addrs),
                              onTap: () {
                                Navigator.pop(context);
                                widget.onSelected(places.elementAt(index),widget.isFrom);
                              },
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                                height: 1,
                                color: Color(0xfff5f5f5),
                              ),
                          itemCount: places.length);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
