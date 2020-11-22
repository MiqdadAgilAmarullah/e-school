import 'dart:convert';
import 'dart:ui';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
// import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
// ignore: unused_import
import 'package:login_page/home/home.dart';

class Absensi extends StatefulWidget {
  @override
  _AbsensiState createState() => _AbsensiState();
}

class _AbsensiState extends State<Absensi> {
  var finaldate1;
  var finaldate2;
  String base64Image;
  String messageUpload = "";
  File _image;
  String url = "http://192.168.43.181/api_eschool/index.php/api/do_upload";

  Future<void> _showuploadDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(messageUpload),
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

  void callDatePicker() async {
    var order1 = await getDate();

    setState(() {
      finaldate1 = order1;
    });
  }

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        base64Image = base64Encode(_image.readAsBytesSync());
      } else {
        print('No image selected.');
      }
    });
  }

  Future getCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        base64Image = base64Encode(_image.readAsBytesSync());
      } else {
        print('No image selected.');
      }
    });
  }

  upload() {
    String fileName = _image.path.split("/").last;
    mulaiupload(fileName);
  }

  mulaiupload(String fileName) {
    http.post(url, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setState(() {
        messageUpload = result.body;
        _showuploadDialog();
        _image = null;
      });
      print(result.body);
    });
  }

  Future<DateTime> getDate() {
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
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff1E64B9),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30))),
                    ),
                    Center(
                      child: Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(top: 10),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: RaisedButton(
                                                  color: Colors.grey[200],
                                                  child: Text("Pilih"),
                                                  onPressed: getImage),
                                            ),
                                            Container(
                                              child: RaisedButton(
                                                color: Colors.grey[200],
                                                child: Icon(
                                                    Icons.camera_alt_outlined),
                                                onPressed: getCamera,
                                              ),
                                            ),
                                            _image == null
                                                ? Text("")
                                                : Container(
                                                    child: RaisedButton(
                                                      textColor: Colors.white,
                                                      color: Colors.blueAccent,
                                                      onPressed: upload,
                                                      child: Text("Upload"),
                                                    ),
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
