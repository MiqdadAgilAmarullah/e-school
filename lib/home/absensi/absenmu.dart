import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Absenmu extends StatefulWidget {
  @override
  _AbsenmuState createState() => _AbsenmuState();
}

class _AbsenmuState extends State<Absenmu> {
  List _dataAbsen = List();
  String list;
  void ambilAbsen() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String kelas = preference.getString("kelas");
    String jurusan = preference.getString("jurusan");
    String nama = preference.getString("nama");

    final response = await http.post(
        "http://192.168.43.181/api_eschool/index.php/api/tampil_absen",
        body: {
          "kelas": kelas,
          "jurusan": jurusan,
          "nama": nama,
        });
    setState(() {
      _dataAbsen = json.decode(response.body);
    });
    print(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ambilAbsen();
  }

  SingleChildScrollView _tableAbsen() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              columns: [
                DataColumn(label: Text("No")),
                DataColumn(label: Text("Nama")),
                DataColumn(label: Text("Kelas")),
                DataColumn(label: Text("Jurusan")),
                DataColumn(label: Text("Bukti")),
                DataColumn(label: Text("dari")),
                DataColumn(label: Text("sampai")),
                DataColumn(label: Text("Deskripsi")),
              ],
              rows: _dataAbsen
                  .map((item) => DataRow(cells: <DataCell>[
                        DataCell(Text(item['int_ID'])),
                        DataCell(Text(item['txt_nama'])),
                        DataCell(Text(item['txt_kelas'])),
                        DataCell(Text(item['txt_jurusan'])),
                        DataCell(Text(item['img_bukti'])),
                        DataCell(Text(item['txt_date1'])),
                        DataCell(Text(item['txt_date2'])),
                        DataCell(Text(item['txt_deskripsi'])),
                      ]))
                  .toList())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xff1E64B9),
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[_tableAbsen()],
        ),
      ),
    );
  }
}
