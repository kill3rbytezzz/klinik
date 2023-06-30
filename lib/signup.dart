import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'login.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new signup(),
  ));
}

class signup extends StatefulWidget {
  @override
  _signup createState() => new _signup();
}

class _signup extends State<signup> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPassword2 = TextEditingController();

  Future<void> Startsignup() async {
    String url = "http://192.168.100.129:3000/signup";

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {
      'username': controllerUsername.text,
      'email': controllerEmail.text,
      'password': controllerPassword.text
    };
    String requestBody = json.encode(data);
    await http.post(Uri.parse(url), headers: headers, body: requestBody);
  }

  @override
  Widget build(BuildContext context) {
    final widthscreen = MediaQuery.of(context).size.width;
    return Container(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 83, 163, 197),
      body: SingleChildScrollView(
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
                alignment: Alignment.centerLeft,
                width: widthscreen,
                height: 40,
                color: Color.fromARGB(0, 0, 120, 120),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.transparent,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(0.5),
                        child: Image.asset("assets/images/arrow.png"),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.transparent,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(0.5),
                        child: Image.asset("assets/images/arrow.png"),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.transparent,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(0.5),
                        child: Image.asset("assets/images/arrow.png"),
                      ),
                    ),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                width: 250,
                height: 40,
                color: Color.fromARGB(0, 0, 120, 120),
                child: Text("SIGN UP",
                    style: TextStyle(
                        fontFamily: "OpenSans-Light",
                        fontWeight: FontWeight.w900,
                        fontSize: 32))),
            Container(
                width: 10, height: 30, color: Color.fromARGB(0, 0, 120, 120)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "USERNAME               ",
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                Text("                                                ")
              ],
            ),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
              width: 300,
              height: 50,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(100, 230, 230, 230),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  )),
              child: TextField(
                controller: controllerUsername,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Masukkan Username Anda',
                    hintStyle: TextStyle(fontFamily: 'DMSans')),
              ),
            ),
            Container(
              width: 15,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "EMAIL                          ",
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                Text("                                                ")
              ],
            ),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
              width: 300,
              height: 50,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(100, 230, 230, 230),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  )),
              child: TextField(
                controller: controllerEmail,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Masukkan Email Anda',
                    hintStyle: TextStyle(fontFamily: 'DMSans')),
              ),
            ),
            Container(
                width: 10, height: 5, color: Color.fromARGB(0, 0, 120, 120)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PASSWORD               ",
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                Text("                                                ")
              ],
            ),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
              width: 300,
              height: 50,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(100, 230, 230, 230),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  )),
              child: TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Masukkan Password Anda',
                    hintStyle: TextStyle(fontFamily: 'DMSans')),
              ),
            ),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
                width: 10, height: 5, color: Color.fromARGB(0, 0, 120, 120)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CONFIRM PASSWORD",
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                Text("                                            ")
              ],
            ),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
              width: 300,
              height: 50,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(100, 230, 230, 230),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  )),
              child: TextField(
                controller: controllerPassword2,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Konfirmasi Password Anda',
                    hintStyle: TextStyle(fontFamily: 'DMSans')),
              ),
            ),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Container(
              width: 10,
              height: 70,
              color: Color.fromARGB(0, 255, 0, 0),
            ),
            Container(
              height: 40,
              width: 280,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0),
                  )),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  if (controllerUsername.text == "" ||
                      controllerEmail.text == "" ||
                      controllerPassword.text == "" ||
                      controllerPassword2 == "") {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text('Data Tidak Lengkap'),
                              content: Text(
                                  "Pastikan anda mengisi semua data yang ada"),
                            ));
                  } else {
                    if (controllerPassword.text == controllerPassword2.text) {
                      Startsignup().then((_) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Anda Berhasil Mendaftar'),
                                content: Text(
                                    'Anda telah berhasil mendaftar, silahkan login ke aplikasi'),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  new login()));
                                    },
                                  ),
                                ],
                              );
                            });
                      });
                    } else if (controllerPassword.text.length < 8) {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Password Tidak Kuat'),
                                content: Text(
                                    "Password harus terdiri lebih dari 8 kata"),
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Password Tidak Sama'),
                                content: Text(
                                    "Password yang anda masukkan tidak sama"),
                              ));
                    }
                  }
                  ;
                },
                child: Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                      fontFamily: 'OpenSans-Reg',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 10,
              height: 10,
              color: Color.fromARGB(0, 255, 0, 0),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.transparent,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset("assets/images/dokter.png"),
              ),
            )
          ])),
    ));
  }
}
