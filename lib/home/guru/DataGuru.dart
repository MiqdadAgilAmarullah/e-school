import 'package:flutter/material.dart';
// import 'package:login_page/home/homePage.dart';
// ignore: unused_import
import 'package:login_page/home/home.dart';

class DataGuru extends StatefulWidget {
  @override
  _DataGuruState createState() => _DataGuruState();
}

class _DataGuruState extends State<DataGuru> {
  final List<String> guru = <String>[
    'Ahmad Abror',
    'Lusi Sri',
    'Budi pekerti',
    'Kelvin',
    'Yati Lisyati',
    'Jojo',
    'Asep Setiawan',
    'Mumu Arifin',
    'Tantowi Ahmad',
  ];
  final List<String> pelajaran = <String>[
    'Fisika',
    'Matematika',
    'Kimia',
    'Teknik Gambar',
    'Dasar Listrik',
    'Home Theater',
    'Teknik Digital',
    'Agama',
    'Kewirausahaan',
  ];
  final List<String> foto = <String>[
    'assets/guru1.jpg',
    'assets/guru3.jpg',
    'assets/guru3.jpeg',
    'assets/guru2.jpg',
    'assets/guru4.jpeg',
    'assets/guru6.jpg',
    'assets/guru7.jpg',
    'assets/guru8.jpg',
    'assets/guru9.jpg',
  ];

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
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(guru.length, (index) {
                  return Center(
                      child: Container(
                    height: 150,
                    width: 155,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage("${foto[index]}"),
                        ),
                        Divider(),
                        Text('${guru[index]}'),
                        Text(
                          '${pelajaran[index]}',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
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
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
