import 'package:easa/Rooms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:validation_extensions/validation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bathroom2 extends StatefulWidget {
  @override
  _Bathroom2State createState() => _Bathroom2State();
}

class _Bathroom2State extends State<Bathroom2> {
  // TextField Controllers
  TextEditingController question5 = TextEditingController();
  TextEditingController question6 = TextEditingController();
  TextEditingController question7 = TextEditingController();

//the keys
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

//entered values, might not need them
  String q5;
  String q6;
  String q7;

//from here we are setting the online DB.
  @override
  void initState() {
    super.initState();
    question5 = new TextEditingController();
    question6 = new TextEditingController();
    question7 = new TextEditingController();
  }

  void sendInfo() async {
    Uri url = Uri.parse(
        'https://muni2021.000webhostapp.com/login_flutter/Bathroom.php');
    var data = {
      "question10": question5.text,
      "question11": question6.text,
      "question12": question7.text,
    };

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "true") {
    } else {
      Fluttertoast.showToast(msg: "Error", toastLength: Toast.LENGTH_SHORT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text("Bathroom Sheet")),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Text(
                    "Ask owner to show you water flow devices",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey5,
                    controller: question5,
                    decoration: InputDecoration(
                      labelText: "Observation",
                      enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(

                              //color: Colors.blue,
                              )),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  Text(
                    "Ask owner to show you the windows",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey6,
                    controller: question6,
                    decoration: InputDecoration(
                      labelText: "Observation",
                      enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              //color: Colors.blue,
                              )),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  Text(
                    "Ask owner to show you all electrical devices",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey7,
                    controller: question7,
                    decoration: InputDecoration(
                      labelText: "Observation",
                      enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              //color: Colors.blue,
                              )),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(120, 200, 0, 0),
                    child: RaisedButton(
                        child: Text(
                          "Submit Sheet",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          sendInfo();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Rooms()));
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
