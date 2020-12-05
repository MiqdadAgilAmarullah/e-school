import 'package:flutter/material.dart';
import 'package:login_page/login.dart';
import './homePage.dart';
import './guru/DataGuru.dart';
import './absensi/absensi.dart';
import './absensi/absenmu.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  // Declare a field that holds the Person data
  final Data data;
  // In the constructor, require a Person
  Home({Key key, @required this.data}) : super(key: key);

  @override
  _StateHome createState() => _StateHome(
        data: data,
      );
}

Future<bool> _exitApp(BuildContext dialogContex) {
  return showDialog(
        context: dialogContex,
        child: AlertDialog(
          title: Text('Do you want to exit this application?'),
          content: Text('We hate to see you leave...'),
          actions: <Widget>[
            // FlatButton(
            //   onPressed: () => Navigator.pop(dialogContex, false),
            //   child: Text('No'),
            // ),
            FlatButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}

class _StateHome extends State<Home> {
  // ignore: non_constant_identifier_names
  String _url_foto = "http://192.168.43.181/api_eschool/foto/";

  final Data data;
  _StateHome({this.data});
  int _currentindex = 0;

  var tabs = [
    HomePage(),
    Container(
      child: Center(child: Text("asbvcka")),
    ),
    Container(
      child: Center(child: Text("Prestasi")),
    ),
    DataGuru(),
    Absensi(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xff1E64B9),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.school,
                size: 30,
                color: Colors.white,
              ),
              Text(
                " E-School",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () {
                  _exitApp(context);
                })
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff1E64B9),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(_url_foto + data.foto),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("${data.nama}",
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Kelas ${data.kelas} ${data.jurusan}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Raport'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Absenmu(),
                  ));
                },
                child: ListTile(
                  leading: Icon(Icons.calendar_today_outlined),
                  title: Text('Absenmu'),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.schedule_outlined,
                  color: Colors.white,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  "Jadwal",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  "prestasi",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervised_user_circle_outlined,
                  color: Colors.white,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  "Guru",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.event,
                  color: Colors.white,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  "Absensi",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          backgroundColor: Color(0xff1E64B9),
        ),
        body: tabs[_currentindex],
      ),
    );
  }
}
