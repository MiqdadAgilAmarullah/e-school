import 'package:flutter/material.dart';

class KumpulanTugas extends StatefulWidget {
  @override
  _KumpulanTugasState createState() => _KumpulanTugasState();
}

class _KumpulanTugasState extends State<KumpulanTugas> {
  final List<String> entries = <String>[
    'Fisika',
    'Matematika',
    'Kimia',
    'Teknik Gambar',
    'Dasar Listrik',
  ];
  final List<String> deadline = <String>[
    '22, okt 2020',
    '22, okt 2020',
    '22, okt 2020',
    '22, okt 2020',
    '22, okt 2020',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 116,
                  decoration: BoxDecoration(
                      color: Color(0xff1E64B9),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30))),
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
                        "Kumpulan Tugas",
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
                          Container(width: 60, child: Icon(Icons.book)),
                          Container(
                              width: 130,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(' ${entries[index]}'),
                                ],
                              )),
                          VerticalDivider(
                            color: Colors.grey,
                          ),
                          Container(
                            width: 120,
                            padding: EdgeInsets.all(5),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 15,
                                    child: Text(
                                      "Deadline :",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  Text(
                                    "${deadline[index]}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
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
      )),
    );
  }
}
