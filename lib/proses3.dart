import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'proses4.dart';

bool loading = true;

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new proses3(),
  ));
}

class proses3 extends StatefulWidget {
  @override
  _proses3 createState() => new _proses3();
}

class _proses3 extends State<proses3> {
  Future<void> PostReg() async {
    String url = "http://192.168.100.129:3000/register";

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {};
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
                        color: Color.fromARGB(255, 141, 202, 241),
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
                        color: Color.fromARGB(255, 187, 225, 249),
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
              height: 200,
            ),
            Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 69, 168, 52),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(75.0),
                      topRight: const Radius.circular(75.0),
                      bottomLeft: const Radius.circular(75.0),
                      bottomRight: const Radius.circular(75.0),
                    )),
                child: Icon(
                  Icons.check,
                  size: 100,
                  color: Colors.white,
                )),
            Container(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 200,
              child: Text(
                "Permintaan Di Terima",
                style: TextStyle(
                    fontFamily: "OpenSans-Reg",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ])),
    ));
  }
}
