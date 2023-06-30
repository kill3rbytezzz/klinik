import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:klinik/home.dart';
import 'package:klinik/proses1.dart';
import 'package:klinik/tanggalres.dart';
import 'dart:convert';
import 'login.dart';
import 'package:http/http.dart' as http;

var keluhan = "";
var poli = "";

TextEditingController controllerKeluhan = TextEditingController();

List<String> options = [
  'Poli Anak',
  'Poli Mata',
  'Poli Saraf',
  'Poli Gizi',
  'Poli THT',
  'Poli Umum'
];

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new reservasi(),
  ));
}

class reservasi extends StatefulWidget {
  @override
  _reservasi createState() => new _reservasi();
}

class _reservasi extends State<reservasi> {
  String? selectedOptions = options.first;

  bool isSelectedOption1 = false;
  bool isSelectedOption2 = false;

  Future<void> PostRes() async {
    String url = "http://192.168.100.129:3000/reservasi";

    Map<String, String> headers = {'Content-Type': 'application/json'};
    switch (selectedOptions) {
      case 'Poli Umum':
        poli = '334414';
      case 'Poli Anak':
        poli = '334412';
      case 'Poli Mata':
        poli = '334416';
      case 'Poli Saraf':
        poli = '334417';
      case 'Poli Gizi':
        poli = '334413';
      case 'Poli THT':
        poli = '334415';
    }
    Map<String, dynamic> data = {
      'id': id,
      'keluhan': controllerKeluhan.text,
      'poli': poli,
      'tanggal': controllerTanggal.text,
      'jam': jam,
      'menit': menit
    };
    String requestBody = json.encode(data);
    await http.post(Uri.parse(url), headers: headers, body: requestBody);
  }

  @override
  Widget build(BuildContext context) {
    final widthscreen = MediaQuery.of(context).size.width;
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
                width: widthscreen,
                height: 30,
                color: Color.fromARGB(0, 0, 120, 120)),
            Container(
              alignment: Alignment.center,
              width: 290,
              height: 40,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 197, 223, 246),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(5.0),
                    topRight: const Radius.circular(5.0),
                    bottomLeft: const Radius.circular(5.0),
                    bottomRight: const Radius.circular(5.0),
                  )),
              child: Text(
                "Data Konsultasi Pasien",
                style: TextStyle(
                    fontFamily: "OpenSans-Reg",
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            Container(
                width: 10, height: 40, color: Color.fromARGB(0, 0, 120, 120)),
            Container(
              width: 350,
              height: 20,
              color: Color.fromARGB(0, 0, 120, 120),
              child: Text(
                "Pemilihan Jadwal Konsultasi",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              // alignment: Alignment.center,
              width: 350,
              height: 40,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 83, 163, 197),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  )),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  controllerKeluhan.text = keluhan;
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new restanggal()));
                },
                child: Text(
                  'Pilih Tanggal',
                  style: TextStyle(fontFamily: 'DMSans', fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 10,
              height: 10,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
              width: 350,
              height: 20,
              color: Color.fromARGB(0, 0, 120, 120),
              child: Text(
                "Catatan Keluhan Penyakit Pasien :",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                width: 350,
                height: 150,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  controller: controllerKeluhan,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily: 'OpenSans-Bold',
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.2)),
                  ),
                )),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
              width: 350,
              height: 20,
              color: Color.fromARGB(0, 0, 120, 120),
              child: Text(
                "Pilih Poliklinik",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 350,
              height: 40,
              decoration: new BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Row(
                children: [
                  Container(
                    width: 7,
                  ),
                  Container(
                    width: 20,
                    child: Icon(Icons.local_hospital_outlined),
                  ),
                  Container(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      child: DropdownButton(
                        value: selectedOptions,
                        hint: Text(
                          'Pilih Poliklinik Tujuan Anda',
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.2)),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOptions = newValue as String;
                          });
                        },
                        items: options.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(
                              option,
                              style: TextStyle(
                                  fontFamily: 'OpenSans-Bold',
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ))
                ],
              ),
            ),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 40,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 83, 163, 197),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                          bottomLeft: const Radius.circular(20.0),
                          bottomRight: const Radius.circular(20.0),
                        )),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: () {
                        if (controllerKeluhan.text == "" ||
                            controllerTanggal.text == "") {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text('Data Reservasi Tidak Lengkap'),
                                    content: Text(
                                        "Pastikan anda mengisi semua data yang ada"),
                                  ));
                        } else {
                          PostRes().then((_) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Anda Berhasil Reservasi'),
                                    content: Text(
                                        'Silahkan cek info terkait reservasi di menu reservasi'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          new proses1()));
                                        },
                                      ),
                                    ],
                                  );
                                });
                          });
                        }
                      },
                      child: Text(
                        'Reservasi',
                        style: TextStyle(fontFamily: 'DMSans', fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    ));
  }
}
