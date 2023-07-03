import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klinik/home.dart';
// import 'package:klinik/reservasi.dart';
// import 'dart:convert';
// import 'login.dart';
// import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new Diagnosa(),
  ));
}

class Diagnosa extends StatefulWidget {
  @override
  _Diagnosa createState() => new _Diagnosa();
}

class _Diagnosa extends State<Diagnosa> {
  @override
  Widget build(BuildContext context) {
    final widthscreen = MediaQuery.of(context).size.width;
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                "Data Reservasi",
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
              height: 100,
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 51, 102, 153),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0),
                        )),
                  ),
                  Container(
                    height: 5,
                    width: 10,
                    color: Color.fromARGB(255, 51, 102, 153),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 187, 225, 249),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    child: Text(
                      "Permintaan Di Kirim",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 20,
                    color: Color.fromARGB(255, 51, 102, 153),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 187, 225, 249),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    child: Text(
                      "Permintaan Di Terima",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 20,
                    color: Color.fromARGB(255, 51, 102, 153),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 141, 202, 241),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    child: Text(
                      "Permintaan Di Setujui",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 10,
                    color: Color.fromARGB(255, 51, 102, 153),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 51, 102, 153),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              height: 70,
              width: 300,
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 180, 167, 201),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(35.0),
                            topRight: const Radius.circular(35.0),
                            bottomLeft: const Radius.circular(35.0),
                            bottomRight: const Radius.circular(35.0),
                          )),
                      child: Text(
                        reservasi_id.toString(),
                        style: TextStyle(
                            fontFamily: "OpenSans-Reg",
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      "Nomor Antrian",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      ": " + reservasi_id.toString(),
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      "Nama Pasien",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      ": " + P_nama,
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      "Nomor Pasien",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      ": " + pasien_id.toString(),
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      "Kode Poli",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      ": " + poli_id.toString() + " (" + nama_poli + ")",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      "Tanggal Pemeriksaan",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      ": " + tanggalreserv,
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      "Jam Pemeriksaan",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      ": " + jamreserv,
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      "Hasil Diagnosa",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 20,
                    child: Text(
                      ": ",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 80,
              width: 300,
              decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0),
                  )),
              child: Text(
                diagnosa,
                style: TextStyle(
                    fontFamily: "OpenSans-Reg",
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              // alignment: Alignment.center,
              width: 300,
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
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Diagnosa()));
                },
                child: Text(
                  'Check Obat',
                  style: TextStyle(fontFamily: 'DMSans', fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              width: 280,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      "Dokter",
                      style: TextStyle(
                          fontFamily: "OpenSans-Reg",
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 90,
              width: 280,
              child: Row(children: [
                Container(
                  width: 230,
                  height: 90,
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 200, 200, 200),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0),
                        bottomLeft: const Radius.circular(10.0),
                        bottomRight: const Radius.circular(10.0),
                      )),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 5,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: new BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(35.0),
                                topRight: const Radius.circular(35.0),
                                bottomLeft: const Radius.circular(35.0),
                                bottomRight: const Radius.circular(35.0),
                              )),
                        ),
                        Container(
                          width: 5,
                        ),
                        Container(
                          width: 145,
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 15,
                                width: 145,
                                child: Text(
                                  D_nama,
                                  style: TextStyle(
                                      fontFamily: "OpenSans-Reg",
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: 3,
                                width: 125,
                                color: Colors.black,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 15,
                                width: 145,
                                child: Text(
                                  nama_poli,
                                  style: TextStyle(
                                      fontFamily: "OpenSans-Reg",
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ]),
            ),
            Container(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 40,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 83, 163, 197),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                    bottomLeft: const Radius.circular(30.0),
                    bottomRight: const Radius.circular(30.0),
                  )),
              child: TextButton(
                onPressed: () async {
                  // await CekBerkas();
                  setState(() {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new home()));
                  });
                },
                child: Text(
                  "Oke",
                  style: TextStyle(
                      fontFamily: "OpenSans-Reg", color: Colors.black),
                ),
              ),
            ),
            Container(
              height: 20,
            )
          ])),
    ));
  }
}
