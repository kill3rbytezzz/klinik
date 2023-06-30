import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klinik/home.dart';
import 'dart:convert';
import 'login.dart';
// import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'registration.dart';

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new profile(),
  ));
}

class profile extends StatefulWidget {
  @override
  _profile createState() => new _profile();
}

class _profile extends State<profile> {
  Future<void> GetProfile() async {
    String url = "http://192.168.100.129:3000/profile";

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {
      'id': id,
    };
    String requestBody = json.encode(data);
    var response =
        await http.post(Uri.parse(url), headers: headers, body: requestBody);
    var jsondata = jsonDecode(response.body);
    NIK = jsondata['NIK'];
    nama = jsondata['nama'];
    Jenis_Kelamin = jsondata['Jenis_Kelamin'];
    tempatL = jsondata['tempatL'];
    TanggalL = jsondata['TanggalL'];
    alamat = jsondata['alamat'];
    // var NIK = jsondata['NIK'];
  }

  @override
  Widget build(BuildContext context) {
    GetProfile();
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
              width: 260,
              height: 30,
              color: Color.fromARGB(0, 0, 0, 255),
              child: Text(
                "Formulir Pendaftaran Online",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold",
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            Container(
                width: 10, height: 15, color: Color.fromARGB(0, 0, 120, 120)),
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
                "Data Calon Pasien",
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
                "NO. NIK",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                height: 40,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  " " + NIK,
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 15,
                      color: Colors.black),
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
                "Nama Lengkap",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                height: 40,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  " " + nama,
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 15,
                      color: Colors.black),
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
                "Tempat Lahir",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                height: 40,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  " " + tempatL,
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 15,
                      color: Colors.black),
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
                "Tanggal Lahir",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                height: 40,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  " " + TanggalL,
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 15,
                      color: Colors.black),
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
                "Jenis Kelamin",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  " " + Jenis_Kelamin,
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 15,
                      color: Colors.black),
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
                "Alamat",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: 350,
                height: 40,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text(
                  " " + alamat,
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 15,
                      color: Colors.black),
                )),
            Container(
              width: 10,
              height: 30,
              color: Color.fromARGB(0, 255, 0, 0),
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
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new registration()));
                      },
                      child: Text(
                        'Edit',
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
