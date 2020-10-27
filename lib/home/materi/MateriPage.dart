import 'package:flutter/material.dart';
import './video.dart';

class KumpulanMateri extends StatefulWidget {
  @override
  _KumpulanMateriState createState() => _KumpulanMateriState();
}

class _KumpulanMateriState extends State<KumpulanMateri> {
  final List<String> entries = <String>[
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
  final List<String> linkVid = <String>[
    'http://192.168.43.181/e-school/video/fisika-pertemuan-1.MP4',
    'http://192.168.43.181/e-school/video/matematika-pertemuan-1.MP4',
    'Kimia',
    'Teknik Gambar',
    'Dasar Listrik',
    'Home Theater',
    'http://192.168.43.181/e-school/video/digital-pertemuan-1.MP4',
    'http://192.168.43.181/e-school/video/pai-pertemuan-1.MP4',
    'Kewirausahaan',
  ];
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
  final List<String> urlFoto = <String>[
    'http://192.168.43.181/e-school/Guru/guru1.jpg',
    'http://192.168.43.181/e-school/Guru/guru3.jpg',
    'http://192.168.43.181/e-school/Guru/guru2.jpg',
    'http://192.168.43.181/e-school/Guru/guru4.jpeg',
    'http://192.168.43.181/e-school/Guru/guru5.jpg',
    'http://192.168.43.181/e-school/Guru/guru6.jpg',
    'http://192.168.43.181/e-school/Guru/guru7.jpg',
    'http://192.168.43.181/e-school/Guru/guru8.jpg',
    'http://192.168.43.181/e-school/Guru/guru9.jpg',
  ];

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
                  child: ListView.separated(
                    padding: const EdgeInsets.all(15),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 200,
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
                        height: 53,
                        child: Row(
                          children: <Widget>[
                            Container(width: 60, child: Icon(Icons.videocam)),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChewieDemo(
                                          mapel: '${entries[index]}',
                                          linkVid: '${linkVid[index]}',
                                          guru: ' ${guru[index]}',
                                          foto: '${urlFoto[index]}',
                                        )));
                              },
                              child: Container(
                                  width: 130,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(' ${entries[index]}'),
                                    ],
                                  )),
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text("${guru[index]}"),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
