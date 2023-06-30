import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klinik/signup.dart';
import 'dart:convert';
import 'home.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "Medical Clinic",
    home: new login(),
  ));
}

var id;
var perms;
var reg;

class login extends StatefulWidget {
  @override
  _login createState() => new _login();
}

class _login extends State<login> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPsw = TextEditingController();

  StartLogin() async {
    String url = "http://192.168.100.129:3000/login";

    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {
      'username': controllerUsername.text,
      'password': controllerPsw.text
    };
    String requestBody = json.encode(data);
    var response =
        await http.post(Uri.parse(url), headers: headers, body: requestBody);
    var jsondata = jsonDecode(response.body);
    perms = jsondata["message"];
    id = jsondata["id"];
    reg = jsondata["reg"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
              width: 10,
              height: 70,
              color: Color.fromARGB(0, 0, 120, 120),
            ),
            Container(
              width: 150,
              height: 150,
              color: Color.fromARGB(0, 0, 120, 120),
              child: Image.asset("assets/images/logo.jpg"),
            ),
            Container(
                alignment: Alignment.center,
                width: 250,
                height: 40,
                color: Color.fromARGB(0, 0, 120, 120),
                child: Text("Medical  Clinic",
                    style: TextStyle(
                        fontFamily: "Trocchi",
                        fontWeight: FontWeight.bold,
                        fontSize: 30))),
            Container(
                width: 10, height: 70, color: Color.fromARGB(0, 0, 120, 120)),
            Container(
                alignment: Alignment.center,
                width: 250,
                height: 40,
                color: Color.fromARGB(0, 0, 120, 120),
                child: Text("Login",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 30))),
            Container(
                width: 10, height: 30, color: Color.fromARGB(0, 0, 120, 120)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ID             ",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 230, 230, 230),
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
                width: 250,
                height: 40,
                decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                      bottomLeft: const Radius.circular(10.0),
                      bottomRight: const Radius.circular(10.0),
                    )),
                child: TextField(
                  controller: controllerUsername,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Type your username',
                    hintStyle: TextStyle(
                        fontFamily: 'Montserrat', fontSize: 10, height: 2.4),
                  ),
                )),
            Container(
              width: 10,
              height: 5,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 230, 230, 230),
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
                width: 250,
                height: 40,
                decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                      bottomLeft: const Radius.circular(10.0),
                      bottomRight: const Radius.circular(10.0),
                    )),
                child: TextField(
                  controller: controllerPsw,
                  decoration: InputDecoration(
                    // label: 'username',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Type your password',
                    hintStyle: TextStyle(
                        fontFamily: 'Montserrat', fontSize: 10, height: 2.4),
                  ),
                )),
            Container(
              width: 10,
              height: 30,
              color: Color.fromARGB(0, 255, 0, 0),
            ),
            Container(
              height: 40,
              width: 250,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 83, 163, 197),
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
                onPressed: () async {
                  await StartLogin();
                  setState(() {
                    if (perms == "true") {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new home()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Username Atau Password Salah'),
                                content: Text(
                                    "Username Atau Password yang anda masukkan salah"),
                              ));
                    }
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 30,
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  // Perform some action when the container is clicked
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new signup()));
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tidak punya akun?',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Buat Akun',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 13,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ])),
    ));
  }
}
