import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:klinik/reservasi.dart';

List<String> getmenit = [];
var menit = "";
var jam = "08";
bool menit00 = false;
bool menit10 = false;
bool menit20 = false;
bool menit30 = false;
bool menit40 = false;
bool menit50 = false;

bool ismenit00 = false;
bool ismenit10 = false;
bool ismenit20 = false;
bool ismenit30 = false;
bool ismenit40 = false;
bool ismenit50 = false;

bool jam8 = true;
bool jam9 = false;
bool jam10 = false;
bool jam11 = false;
bool jam12 = false;
bool jam13 = false;
bool jam14 = false;
bool jam15 = false;
bool jam16 = false;
bool jam17 = false;

TextEditingController controllerTanggal = TextEditingController();

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new restanggal(),
  ));
}

class restanggal extends StatefulWidget {
  @override
  _restanggal createState() => new _restanggal();
}

class _restanggal extends State<restanggal> {
  selectMenit() {
    menit00 = false;
    menit10 = false;
    menit20 = false;
    menit30 = false;
    menit40 = false;
    menit50 = false;
    for (var i = 0; i < getmenit.length; i++) {
      if (getmenit[i] == "00") {
        menit00 = true;
      }
      if (getmenit[i] == "10") {
        menit10 = true;
      }
      if (getmenit[i] == "20") {
        menit20 = true;
      }
      if (getmenit[i] == "30") {
        menit30 = true;
      }
      if (getmenit[i] == "40") {
        menit40 = true;
      }
      if (getmenit[i] == "50") {
        menit50 = true;
      }
    }
  }

  ismenit() {
    ismenit00 =
        ismenit10 = ismenit20 = ismenit30 = ismenit40 = ismenit50 = false;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    );

    if (picked != null) {
      setState(() {
        controllerTanggal.text = DateFormat('yyyy-MM-dd').format(picked);
        ;
      });
    }
  }

  Future<void> PostJadwal() async {
    getmenit = [];
    String url = "http://192.168.100.129:3000/getjadwal";
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {'jam': jam, 'tanggal': controllerTanggal.text};
    String requestBody = json.encode(data);
    var response =
        await http.post(Uri.parse(url), headers: headers, body: requestBody);
    var jsondata = jsonDecode(response.body);
    for (var data in jsondata) {
      getmenit.add(data["menit"]);
    }
    for (var menit in getmenit) {
      print(menit);
    }
  }

  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
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
                "Reservasi Tanggal dan Jam",
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
              // alignment: Alignment.center,
              width: 350,
              height: 40,
              child: Row(
                children: [
                  Container(
                      width: 170,
                      decoration: new BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: GestureDetector(
                        onTap: () => _selectDate(
                            context), // Call _selectDate method on tap
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 7,
                            ),
                            Icon(Icons.calendar_month_outlined),
                            SizedBox(width: 10),
                            Text(
                              controllerTanggal.text.isEmpty
                                  ? 'Pilih Tanggal'
                                  : controllerTanggal.text,
                              style: TextStyle(
                                fontFamily: 'OpenSans-Bold',
                                fontSize: 15,
                                color: controllerTanggal.text.isEmpty
                                    ? Colors.black.withOpacity(0.2)
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
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
                "Pemilihan Jam Konsultasi",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: 120,
                width: 350,
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 60,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam8 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam8 = true;
                                        jam9 = jam10 = jam11 = jam12 = jam13 =
                                            jam14 =
                                                jam15 = jam16 = jam17 = false;
                                        jam = "08";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "08",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam9 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam9 = true;
                                        jam8 = jam10 = jam11 = jam12 = jam13 =
                                            jam14 =
                                                jam15 = jam16 = jam17 = false;
                                        jam = "09";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "09",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam10 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam10 = true;
                                        jam9 = jam8 = jam11 = jam12 = jam13 =
                                            jam14 =
                                                jam15 = jam16 = jam17 = false;
                                        jam = "10";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "10",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam11 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam11 = true;
                                        jam9 = jam10 = jam8 = jam12 = jam13 =
                                            jam14 =
                                                jam15 = jam16 = jam17 = false;
                                        jam = "11";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "11",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam12 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam12 = true;
                                        jam9 = jam10 = jam11 = jam8 = jam13 =
                                            jam14 =
                                                jam15 = jam16 = jam17 = false;
                                        jam = "12";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "12",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 60,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam13 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam13 = true;
                                        jam9 = jam10 = jam11 = jam12 = jam8 =
                                            jam14 =
                                                jam15 = jam16 = jam17 = false;
                                        jam = "13";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "13",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam14 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam14 = true;
                                        jam8 = jam10 = jam11 = jam12 = jam13 =
                                            jam9 =
                                                jam15 = jam16 = jam17 = false;
                                        jam = "14";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "14",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam15 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam15 = true;
                                        jam9 = jam8 = jam11 = jam12 = jam13 =
                                            jam14 =
                                                jam10 = jam16 = jam17 = false;
                                        jam = "15";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "15",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam16 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam16 = true;
                                        jam9 = jam10 = jam8 = jam12 = jam13 =
                                            jam14 =
                                                jam15 = jam11 = jam17 = false;
                                        jam = "16";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "16",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: jam17 ? Colors.amber : Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        overlay.during(Future.delayed(
                                            const Duration(seconds: 2)));
                                        ismenit();
                                        if (controllerTanggal.text.isEmpty) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: Text(
                                                        'Tanggal Belum Dipilih'),
                                                    content: Text(
                                                        "Silahkan pilih tanggal terlebih dahulu"),
                                                  ));
                                        }
                                        jam17 = true;
                                        jam9 = jam10 = jam11 = jam8 = jam13 =
                                            jam14 =
                                                jam15 = jam16 = jam12 = false;
                                        jam = "17";
                                      });
                                      await PostJadwal();
                                      setState(() {
                                        selectMenit();
                                      });
                                    },
                                    child: Text(
                                      "17",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              width: 350,
              height: 20,
              color: Color.fromARGB(0, 0, 120, 120),
              child: Text(
                "==============================================",
                style: TextStyle(
                    fontFamily: "OpenSans-Bold", fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: 120,
                width: 350,
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 60,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: menit00 ? Colors.red : Colors.green,
                                  ),
                                  child: TextButton(
                                    onPressed: menit00
                                        ? null
                                        : () {
                                            setState(() {
                                              ismenit00 = true;
                                              ismenit10 = ismenit20 =
                                                  ismenit30 = ismenit40 =
                                                      ismenit50 = false;
                                              menit = "00";
                                            });
                                          },
                                    child: Text(
                                      "00",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: ismenit00
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: menit10 ? Colors.red : Colors.green,
                                  ),
                                  child: TextButton(
                                    onPressed: menit10
                                        ? null
                                        : () {
                                            setState(() {
                                              ismenit10 = true;
                                              ismenit00 = ismenit20 =
                                                  ismenit30 = ismenit40 =
                                                      ismenit50 = false;
                                              menit = "10";
                                            });
                                          },
                                    child: Text(
                                      "10",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: ismenit10
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: menit20 ? Colors.red : Colors.green,
                                  ),
                                  child: TextButton(
                                    onPressed: menit20
                                        ? null
                                        : () {
                                            setState(() {
                                              ismenit20 = true;
                                              ismenit10 = ismenit00 =
                                                  ismenit30 = ismenit40 =
                                                      ismenit50 = false;
                                              menit = "20";
                                            });
                                          },
                                    child: Text(
                                      "20",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: ismenit20
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: menit30 ? Colors.red : Colors.green,
                                  ),
                                  child: TextButton(
                                    onPressed: menit30
                                        ? null
                                        : () {
                                            setState(() {
                                              ismenit30 = true;
                                              ismenit10 = ismenit20 =
                                                  ismenit00 = ismenit40 =
                                                      ismenit50 = false;
                                              menit = "30";
                                            });
                                          },
                                    child: Text(
                                      "30",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: ismenit30
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: menit40 ? Colors.red : Colors.green,
                                  ),
                                  child: TextButton(
                                    onPressed: menit40
                                        ? null
                                        : () {
                                            setState(() {
                                              ismenit40 = true;
                                              ismenit10 = ismenit20 =
                                                  ismenit30 = ismenit00 =
                                                      ismenit50 = false;
                                              menit = "40";
                                            });
                                          },
                                    child: Text(
                                      "40",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: ismenit40
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  )),
                              Container(
                                width: 10,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: menit50 ? Colors.red : Colors.green,
                                  ),
                                  child: TextButton(
                                    onPressed: menit50
                                        ? null
                                        : () {
                                            setState(() {
                                              ismenit50 = true;
                                              ismenit10 = ismenit20 =
                                                  ismenit30 = ismenit40 =
                                                      ismenit00 = false;
                                              menit = "50";
                                            });
                                          },
                                    child: Text(
                                      "50",
                                      style: TextStyle(
                                          fontFamily: "OpenSans-Bold",
                                          fontSize: 20,
                                          color: ismenit50
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
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
                        if (controllerTanggal.text.isEmpty || menit == "") {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text(
                                        'Tanggal, Jam atau Menit belum dipilih'),
                                    content: Text(
                                        "Pastikan anda sudah memilih Tanggal, Jam dan Menit"),
                                  ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:
                                      Text('Tanggal dan Jam berhasil dipilih'),
                                  content: Text(
                                      'Tekan OK untuk kembali ke menu reservasi'),
                                  actions: [
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new reservasi()));
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: Text(
                        'Ok',
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

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: const Center(child: CircularProgressIndicator()));
  }
}
