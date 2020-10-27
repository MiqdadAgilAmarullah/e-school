import 'dart:ui';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:login_page/home/home.dart';

class Absensi extends StatefulWidget {
  @override
  _AbsensiState createState() => _AbsensiState();
}

class _AbsensiState extends State<Absensi> {
  var finaldate1;
  var finaldate2;

  void callDatePicker() async {
    var order1 = await getDate();

    setState(() {
      finaldate1 = order1;
    });
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is7
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(3000),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  void callDatePicker2() async {
    var order2 = await getDate2();

    setState(() {
      finaldate2 = order2;
    });
  }

  Future<DateTime> getDate2() {
    // Imagine that this function is7
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(3000),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffE4E4E4),
      body: Material(
        child: Container(
          color: Color(0xffE4E4E4),
          child: SingleChildScrollView(
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
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Home(),
                          ));
                        },
                      ),
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
                          color: Colors.transparent,
                          margin: EdgeInsets.only(top: 80),
                          child: Text(
                            "Absensi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffF9F9F6),
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
                      padding: EdgeInsets.all(15),
                      height: 164,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Dari Tanggal :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: callDatePicker,
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 250,
                                    child: finaldate1 == null
                                        ? Text(
                                            "",
                                          )
                                        : Text(
                                            "$finaldate1",
                                          ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 0.5))),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.date_range),
                                    onPressed: null,
                                    iconSize: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Sampai Tanggal :",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          InkWell(
                            onTap: callDatePicker2,
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 250,
                                    child: finaldate2 == null
                                        ? Text(
                                            "",
                                          )
                                        : Text(
                                            "$finaldate2",
                                          ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 0.5))),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.date_range),
                                    onPressed: null,
                                    iconSize: 30,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffF9F9F6),
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
                      padding: EdgeInsets.all(15),
                      height: 264,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deskripsi :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              child: TextField(
                                scrollPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                                style: TextStyle(fontSize: 12),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              width: 300,
                            ),
                            Text(
                              "Upload Bukti :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 150,
                                  width: 200,
                                  color: Colors.black12,
                                  margin: EdgeInsets.only(top: 10),
                                  child: _image == null
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 35),
                                          child: Text('No image selected.'))
                                      : Image.file(
                                          _image,
                                          height: 100,
                                          width: 90,
                                        ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 10),
                                        child: Column(
                                          children: [
                                            RaisedButton(
                                                child: Text("Pilih"),
                                                onPressed: getImage),
                                            _image == null
                                                ? Text("")
                                                : RaisedButton(
                                                    onPressed: () {},
                                                    child: Text("Upload"),
                                                  )
                                          ],
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
