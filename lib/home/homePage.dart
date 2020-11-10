import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_page/home/home.dart';
import 'package:login_page/home/materi/MateriPage.dart';
import 'package:login_page/home/tugas/TugasPage.dart';
import 'package:login_page/login.dart';

class HomePage extends StatefulWidget {
  final Data data;
  HomePage({this.data});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerEdgeDragWidth: 0,

      body: Material(
        child: Container(
          color: Colors.blueGrey[50],
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Color(0xff1E64B9),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(40))),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 100),
                  height: 160,
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Selamat Datang,",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            width: 300,
                            child: FutureBuilder(
                              future: FlutterSession().get("nama"),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.hasData
                                      ? snapshot.data
                                      : "loading...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 20,
                            child: FutureBuilder(
                              future: FlutterSession().get("jurusan"),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.hasData
                                      ? snapshot.data.toString()
                                      : "loading...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 20,
                            child: FutureBuilder(
                              future: FlutterSession().get("logged"),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.hasData
                                      ? "Masuk Terakhir " +
                                          snapshot.data.toString()
                                      : "loading...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                );
                              },
                            ),
                          ),
                        ]),
                    padding: EdgeInsets.all(20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150, left: 30, right: 30),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                Container(
                                  height: 20,
                                  child: FutureBuilder(
                                    future: FlutterSession().get("nama"),
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.hasData
                                            ? "Dear " + snapshot.data.toString()
                                            : "loading...",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
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
                  margin: EdgeInsets.only(top: 270),
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
                  margin: EdgeInsets.only(top: 350),
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
