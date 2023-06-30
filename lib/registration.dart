import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klinik/home.dart';
import 'dart:convert';
import 'login.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

var jk = "";

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new registration(),
  ));
}

class registration extends StatefulWidget {
  @override
  _registration createState() => new _registration();
}

class _registration extends State<registration> {
  TextEditingController controllerNIK = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerTempatL = TextEditingController();
  TextEditingController controllerTanggalL = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();

  bool isSelectedOption1 = false;
  bool isSelectedOption2 = false;

  void selectOption1() {
    setState(() {
      isSelectedOption1 = true;
      isSelectedOption2 = false;
      jk = "Laki-Laki";
    });
  }

  void selectOption2() {
    setState(() {
      isSelectedOption1 = false;
      isSelectedOption2 = true;
      jk = "Perempuan";
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        controllerTanggalL.text = DateFormat('yyyy-MM-dd').format(picked);
        ;
      });
    }
  }

  Future<void> PostReg() async {
    String url = "http://192.168.100.129:3000/register";

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {
      'id': id,
      'NIK': controllerNIK.text,
      'nama': controllerNama.text,
      'tempatL': controllerTempatL.text,
      'jk': jk,
      'tanggalL': controllerTanggalL.text,
      'alamat': controllerAlamat.text
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
                alignment: Alignment.center,
                width: 350,
                height: 40,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: TextField(
                  controller: controllerNIK,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // label: 'username',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.confirmation_number_outlined),
                    hintText: 'NO. NIK',
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
                "Nama Lengkap",
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
                child: TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    // label: 'username',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Nama Lengkap',
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
                "Tempat Lahir",
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
                child: TextField(
                  controller: controllerTempatL,
                  decoration: InputDecoration(
                    // label: 'username',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.place),
                    hintText: 'Tempat Lahir',
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
                "Tanggal Lahir",
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
                child: GestureDetector(
                  onTap: () =>
                      _selectDate(context), // Call _selectDate method on tap
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 7,
                      ),
                      Icon(Icons.calendar_month_outlined),
                      SizedBox(width: 10),
                      Text(
                        controllerTanggalL.text.isEmpty
                            ? 'Tanggal Lahir'
                            : controllerTanggalL.text,
                        style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          fontSize: 15,
                          color: controllerTanggalL.text.isEmpty
                              ? Colors.black.withOpacity(0.2)
                              : Colors.black,
                        ),
                      ),
                    ],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: selectOption1,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 173,
                      color:
                          isSelectedOption1 ? Colors.black : Colors.transparent,
                      child: Text(
                        'Laki-Laki',
                        style: TextStyle(
                          fontFamily: isSelectedOption1
                              ? "OpenSans-Bold"
                              : "OpenSans-Reg",
                          color:
                              isSelectedOption1 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: selectOption2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 173,
                      color:
                          isSelectedOption2 ? Colors.black : Colors.transparent,
                      child: Text(
                        'Perempuan',
                        style: TextStyle(
                          fontFamily: isSelectedOption2
                              ? "OpenSans-Bold"
                              : "OpenSans-Reg",
                          color:
                              isSelectedOption2 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
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
                "Alamat",
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
                child: TextField(
                  controller: controllerAlamat,
                  decoration: InputDecoration(
                    // label: 'username',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Alamat',
                    hintStyle: TextStyle(
                        fontFamily: 'OpenSans-Bold',
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.2)),
                  ),
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
                        if (controllerAlamat.text == "" ||
                            controllerNIK.text == "" ||
                            controllerNama.text == "" ||
                            controllerTanggalL.text == "" ||
                            controllerTempatL.text == "") {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text('Data Tidak Lengkap'),
                                    content: Text(
                                        "Pastikan anda mengisi semua data yang ada"),
                                  ));
                        } else {
                          PostReg().then((_) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Anda Berhasil Registrasi'),
                                    content: Text(
                                        'Anda telah berhasil registrasi, data anda sudah disimpan'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          new home()));
                                        },
                                      ),
                                    ],
                                  );
                                });
                          });
                        }
                      },
                      child: Text(
                        'Simpan',
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
