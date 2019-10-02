import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: new EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Nguyen Minh Quan",style: TextStyle(fontSize: 18)),
            accountEmail: Text("quannm@songphi.com",style: TextStyle(fontSize: 16)),
            onDetailsPressed: () {},
            margin: EdgeInsets.only(bottom: 0.0),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS?Colors.amber:Colors.white,
              child: Text("Q",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            ),
          ),
          ListTile(
            leading: Image.asset("ic_menu_history.png"),
            title: Text(
              "Ride History",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          ListTile(
            leading: Image.asset("ic_menu_percent.png"),
            title: Text(
              "Offers",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          ListTile(
            leading: Image.asset("ic_menu_notify.png"),
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          ListTile(
            leading: Image.asset("ic_menu_help.png"),
            title: Text(
              "Help & Supports",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          ListTile(
            leading: Image.asset("ic_menu_logout.png"),
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          )
        ],
      ),
    );
  }
}
