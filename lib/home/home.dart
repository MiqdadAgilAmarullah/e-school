import 'package:flutter/material.dart';
import './homePage.dart';
import './guru/DataGuru.dart';
import './absensi/absensi.dart';

class Home extends StatefulWidget {
  @override
  _StateHome createState() => _StateHome();
}

class _StateHome extends State<Home> {
  int _currentindex = 0;

  final tabs = [
    HomePage(),
    Container(
      child: Center(child: Text("Prestasi")),
    ),
    Container(
      child: Center(child: Text("Prestasi")),
    ),
    DataGuru(),
    Absensi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_view_day,
                color: Colors.white,
              ),
              title: Text(
                "Jadwal",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.loyalty,
                color: Colors.white,
              ),
              title: Text(
                "prestasi",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_ind,
                color: Colors.white,
              ),
              title: Text(
                "Guru",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
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
    );
  }
}
