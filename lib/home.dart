import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klinik/berkas.dart';
import 'package:klinik/diagnosa.dart';
import 'package:klinik/login.dart';
import 'package:http/http.dart' as http;
import 'package:klinik/profile.dart';
import 'package:klinik/proses1.dart';
// import 'package:klinik/proses2.dart';
import 'package:klinik/proses3.dart';
import 'package:klinik/proses4.dart';
import 'package:klinik/registration.dart';
import 'reservasi.dart';
import 'dart:convert';
// import 'login.dart';

var NIK = "";
var nama = "";
var Jenis_Kelamin = "";
var tempatL = "";
var TanggalL = "";
var alamat = "";

var pasien_id;
var status;
var reservasi_id;
var P_nama;
var poli_id;
var tanggalreserv;
var jamreserv;
var nama_poli;
var D_nama;
var diagnosa;

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new home(),
  ));
}

class home extends StatefulWidget {
  @override
  _home createState() => new _home();
}

class _home extends State<home> {
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

  CheckID() async {
    String url = "http://192.168.100.129:3000/checkreg";

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {
      'id': id,
    };
    String requestBody = json.encode(data);
    var response =
        await http.post(Uri.parse(url), headers: headers, body: requestBody);
    var jsondata = jsonDecode(response.body);
    pasien_id = jsondata["id"];
    reg = jsondata["registered"];
    status = jsondata["status"];
    reservasi_id = jsondata["reservasi_id"];
    P_nama = jsondata["P_nama"];
    poli_id = jsondata["poli_id"];
    tanggalreserv = jsondata["tanggal"];
    jamreserv = jsondata["jam"];
    nama_poli = jsondata["nama_poli"];
    D_nama = jsondata["D_nama"];
    diagnosa = jsondata['diagnosa'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home.png"), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                Container(
                  width: 10,
                  height: 40,
                  color: Color.fromARGB(0, 0, 120, 120),
                ),
                Container(
                  width: 150,
                  height: 100,
                  color: Color.fromARGB(0, 0, 120, 120),
                  child: Image.asset("assets/images/logo.jpg"),
                ),
                Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 40,
                    color: Color.fromARGB(0, 0, 120, 120),
                    child: Text("Medical  Clinic",
                        style: TextStyle(fontFamily: "Trocchi", fontSize: 30))),
                Container(
                  width: 10,
                  height: 40,
                  color: Color.fromARGB(0, 0, 120, 120),
                ),
                Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 83, 163, 197),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(115.0),
                      topRight: const Radius.circular(115.0),
                      bottomLeft: const Radius.circular(115.0),
                      bottomRight: const Radius.circular(115.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 230,
                        height: 140,
                        color: Color.fromARGB(0, 0, 120, 120),
                        child: Image.asset("assets/images/dokter.png"),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        color: Color.fromARGB(0, 7, 7, 7),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 20,
                        color: Color.fromARGB(0, 0, 120, 120),
                        child: Text("Hai,Konsultasikan",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 20,
                        color: Color.fromARGB(0, 0, 120, 120),
                        child: Text(
                          "Diri Anda Pada Kami !!",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 10,
                  height: 70,
                  color: Color.fromARGB(0, 0, 120, 120),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 163, 197),
                          border: Border.all(
                            color: Color.fromARGB(255, 197, 223, 246),
                            width: 7.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new home()));
                            },
                            child: Icon(
                              Icons.info_outline,
                              size: 60,
                              color: Color.fromARGB(255, 197, 223, 246),
                            )),
                      ),
                      Container(
                        width: 25,
                        height: 40,
                        color: Color.fromARGB(0, 120, 120, 120),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 163, 197),
                          border: Border.all(
                            color: Color.fromARGB(255, 197, 223, 246),
                            width: 7.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          ),
                        ),
                        child: TextButton(
                            onPressed: () async {
                              await CheckID();
                              if (reg == 1) {
                                await GetProfile();
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new profile()));
                              } else {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new registration()));
                              }
                            },
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Color.fromARGB(255, 197, 223, 246),
                            )),
                      ),
                      Container(
                        width: 25,
                        height: 40,
                        color: Color.fromARGB(0, 120, 120, 120),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 163, 197),
                          border: Border.all(
                            color: Color.fromARGB(255, 197, 223, 246),
                            width: 7.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          ),
                        ),
                        child: TextButton(
                            onPressed: () async {
                              await CheckID();
                              if (reg == 0) {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text(
                                              'Anda belum melakukan Registrasi'),
                                          content: Text(
                                              "Silahkan lakukan registrasi terlebih dahulu dengan cara menekan profil"),
                                        ));
                              } else {
                                if (status == 0) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new reservasi()));
                                } else if (status == 1) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new proses1()));
                                } else if (status == 2) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new proses3()));
                                } else if (status == 3) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new proses3()));
                                } else if (status == 4) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new proses4()));
                                } else if (status == 5) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new Berkas()));
                                } else if (status == 6) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new Diagnosa()));
                                }
                              }
                            },
                            child: Icon(
                              Icons.calendar_month_outlined,
                              size: 60,
                              color: Color.fromARGB(255, 197, 223, 246),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  color: Color.fromARGB(0, 120, 120, 120),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 163, 197),
                          border: Border.all(
                            color: Color.fromARGB(255, 197, 223, 246),
                            width: 7.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new home()));
                            },
                            child: Icon(
                              Icons.attach_money,
                              size: 60,
                              color: Color.fromARGB(255, 197, 223, 246),
                            )),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        color: Color.fromARGB(0, 120, 120, 120),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 163, 197),
                          border: Border.all(
                            color: Color.fromARGB(255, 197, 223, 246),
                            width: 7.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new login()));
                            },
                            child: Icon(
                              Icons.logout,
                              size: 60,
                              color: Color.fromARGB(255, 197, 223, 246),
                            )),
                      ),
                    ],
                  ),
                )
              ])))),
    );
  }
}
