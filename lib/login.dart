import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'home/home.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// store data ke class
class Data {
  final String nama;
  final String kelas;
  final String foto;
  final String jurusan;
  Data({this.nama, this.kelas, this.foto, this.jurusan});
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = "";

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

// ignore: missing_return
  Future<List> _login() async {
    final response = await http
        .post("http://192.168.43.181/api_eschool/index.php/api/login", body: {
      "username": user.text,
      "password": pass.text,
    });

    print(response.body);
    var map = json.decode(response.body);

    if (map == "0") {
      setState(() {
        msg = "login gagal";
      });
      _showMyDialog();
    } else {
      await FlutterSession().set("nama", map[0]['txt_nama']);
      await FlutterSession().set("kelas", map[0]['int_kelas']);
      await FlutterSession().set("foto", map[0]['txt_url_foto']);
      await FlutterSession().set("jurusan", map[0]['txt_jurusan']);
      await FlutterSession().set("logged", map[0]['date_logged']);
      // ignore: unused_local_variable
      var data = Data(
        nama: map[0]['txt_nama'],
        kelas: map[0]['int_kelas'],
        foto: map[0]['txt_url_foto'],
        jurusan: map[0]['txt_jurusan'],
      );
      // String nama = map[0]['txt_nama'];
      if (map[0]['int_level'] == "2") {
        // print(kelas);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => Home(
            data: data,
          ),
        ));
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
              ),
              Container(
                height: 270,
                width: 365,
                decoration: BoxDecoration(
                    color: Color(0xFF2272D2),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30))),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 130,
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.school,
                          size: 80,
                          color: Colors.white,
                        ),
                        Text(
                          "E-School",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "SMK KARANGTARUNA PURWAKARTA",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 190),
                    height: 241,
                    width: 293,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    child: Stack(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "LOG IN",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontSize: 20),
                                  )),
                            ]),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 65, left: 20),
                                  child: Text(
                                    "Username",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff3977AE),
                                        fontSize: 15),
                                  )),
                            ]),
                        Container(
                          margin: EdgeInsets.only(top: 75, left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                controller: user,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(top: 150, left: 20),
                                  child: Text(
                                    "Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff3977AE),
                                        fontSize: 15),
                                  )),
                            ]),
                        Container(
                          margin:
                              EdgeInsets.only(top: 160, left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                obscureText: true,
                                controller: pass,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                      height: 50,
                      width: 293,
                      decoration: BoxDecoration(
                          color: Color(0xFF2272D2),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Center(
                          child: Text(
                        "LOG IN",
                        style: TextStyle(color: Colors.white),
                      ))),
                  onPressed: () {
                    _login();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  splashColor: Colors.green,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                      height: 50,
                      width: 293,
                      decoration: BoxDecoration(
                          color: Color(0xFFE4E4E4),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Center(
                          child: Text(
                        "LUPA PASSWORD",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ))),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Positioned(
            child: Text(
              "Karangtaruna Developer @CopyRights 2020",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            bottom: 0,
          ),
        ],
      ),
    );
  }
}
