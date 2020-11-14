import 'dart:convert';

// import 'package:flutter_session/flutter_session.dart';
import 'package:flutter/material.dart';
import './video.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KumpulanMateri extends StatefulWidget {
  @override
  _KumpulanMateriState createState() => _KumpulanMateriState();
}

class Materi {
  final String judul, guru, url, foto;

  Materi(this.judul, this.guru, this.foto, this.url);
}

class _KumpulanMateriState extends State<KumpulanMateri> {
  List<Materi> myAllData = [];

  // ambil list judul materi sesuai session siswa

  // ignore: non_constant_identifier_names
  Future<Materi> _load_materi() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String kelas = preference.getString("kelas");
    String jurusan = preference.getString("jurusan");

    final response = await http
        .post("http://192.168.43.181/api_eschool/index.php/api/materi", body: {
      "kelas": kelas,
      "jurusan": jurusan,
    });

    String responseBody = response.body;
    var jsonBody = json.decode(responseBody);

    // myAllData.forEach((element) {
    //   print("url: ${element.foto}");
    // });

    if (response.statusCode == 200) {
      for (var data in jsonBody) {
        myAllData.add(Materi(data['txt_pelajaran'], data['txt_guru'],
            data['txt_foto'], data['txt_video']));
      }
      setState(() {});
    } else if (response.statusCode == 200 && jsonBody == "0") {
      myAllData = [];
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _load_materi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: 116,
                    decoration: BoxDecoration(
                        color: Color(0xff1E64B9),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30))),
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
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 80),
                        child: Text(
                          "Kumpulan Materi",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
              Container(
                height: 500,
                child: myAllData.length == 0
                    ? Center(child: CircularProgressIndicator())
                    : _showMyUi(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showMyUi() {
    return ListView.builder(
        itemCount: myAllData.length,
        itemBuilder: (context, index) {
          return Container(
            height: 53,
            margin: EdgeInsets.only(bottom: 20),
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
            child: Row(
              children: <Widget>[
                Container(width: 60, child: Icon(Icons.videocam)),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ChewieDemo(
                              mapel: '${myAllData[index].judul}',
                              linkVid: '${myAllData[index].url}',
                              guru: '${myAllData[index].guru}',
                              foto: '${myAllData[index].foto}',
                            )));
                  },
                  child: Container(
                      width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' ${myAllData[index].judul}'),
                        ],
                      )),
                ),
                VerticalDivider(
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text("${myAllData[index].guru}"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
