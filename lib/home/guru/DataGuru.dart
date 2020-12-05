import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataGuru extends StatefulWidget {
  @override
  _DataGuruState createState() => _DataGuruState();
}

class Guru {
  final String nip, nama, foto;

  Guru(this.nip, this.nama, this.foto);
}

class _DataGuruState extends State<DataGuru> {
  List<Guru> allGuru = [];

  Future<Guru> _loadGuru() async {
    final response =
        await http.post("http://192.168.43.181/api_eschool/index.php/api/guru");

    String responseBody = response.body;
    var jsonBody = json.decode(responseBody);

    if (response.statusCode == 200 && jsonBody == "0") {
      allGuru = [];
      setState(() {});
    } else if (response.statusCode == 200) {
      for (var data in jsonBody) {
        allGuru.add(Guru(
            data['int_NIP'].toString(), data['txt_nama'], data['txt_foto']));
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _loadGuru();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          color: Colors.blueGrey[50],
          child: Column(children: [
            Stack(
              children: <Widget>[
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xff1E64B9),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30))),
                ),
                Center(
                  child: Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Data Guru",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
            Container(
              height: 450,
              child: allGuru.length == 0
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    )
                  : uiGuru(),
            ),
          ]),
        ),
      ),
    );
  }

  Widget uiGuru() {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(allGuru.length, (index) {
        return Center(
            child: Container(
          height: 150,
          width: 155,
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage("${allGuru[index].foto}"),
              ),
              Divider(),
              Text(
                '${allGuru[index].nama}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'NIP : ${allGuru[index].nip}',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ],
          ),
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
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color(0xffF9F9F6),
          ),
        ));
      }),
    );
  }
}
