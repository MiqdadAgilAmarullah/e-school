import 'package:flutter/material.dart';
import 'package:login_page/home/materi/MateriPage.dart';
import 'package:login_page/home/tugas/TugasPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerEdgeDragWidth: 0,
      key: _scaffoldKey,
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
                      backgroundImage: AssetImage("assets/img.jpg"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Miqdad Agil Amarullah",
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Elektronika Audio Video",
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
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Material(
        child: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Color(0xff1E64B9),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(40))),
                ),
                AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
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
                          Icons.search,
                          color: Colors.transparent,
                        ),
                        onPressed: null)
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 160,
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Selamat Datang",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            width: 300,
                            child: Text(
                              "MIQDAD AGIL AMARULLAH",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                          Text(
                            "Jurusan Elektronika Audio Video",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Masuk Terakhir Okt, 17 2020 17:52:00",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                        ]),
                    padding: EdgeInsets.all(20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 250, left: 30, right: 30),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                    boxShadow: [
                      //background color of box
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0, // soften the shadow
                        //extend the shadow
                        offset: Offset(
                          3.0, // Move to right 10  horizontally
                          6.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 98,
                        height: 90,
                        decoration: BoxDecoration(
                            // color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage("assets/t.png"))),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          width: 160,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Dear Miqdad",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "5 Hari Lagi menuju UAS!! Lebih giat Lagi belajar ya",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ]))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 370),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.calendar_today),
                              margin: EdgeInsets.all(10),
                              width: 20,
                              height: 53,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      width: 100,
                                      child: Text(
                                        "jadwal pelajaran hari ini",
                                        style: TextStyle(fontSize: 12),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        width: 155,
                        height: 69,
                        decoration: BoxDecoration(
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0, // soften the shadow
                                //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 10  horizontally
                                  6.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.laptop_chromebook),
                              margin: EdgeInsets.all(10),
                              width: 20,
                              height: 53,
                            ),
                            InkWell(
                              highlightColor: Colors.grey,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      KumpulanMateri(),
                                ));
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        width: 100,
                                        child: Text(
                                          "Kumpulan Materi",
                                          style: TextStyle(fontSize: 12),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        width: 155,
                        height: 69,
                        decoration: BoxDecoration(
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0, // soften the shadow
                                //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 10  horizontally
                                  6.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 450),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.book),
                              margin: EdgeInsets.all(10),
                              width: 20,
                              height: 53,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      width: 100,
                                      child: Text(
                                        "Pekerjaan Rumah",
                                        style: TextStyle(fontSize: 12),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        width: 155,
                        height: 69,
                        decoration: BoxDecoration(
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0, // soften the shadow
                                //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 10  horizontally
                                  6.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.assignment),
                              margin: EdgeInsets.all(10),
                              width: 20,
                              height: 53,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      KumpulanTugas(),
                                ));
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        width: 100,
                                        child: Text(
                                          "Kumpulan Tugas",
                                          style: TextStyle(fontSize: 12),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        width: 155,
                        height: 69,
                        decoration: BoxDecoration(
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0, // soften the shadow
                                //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 10  horizontally
                                  6.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
