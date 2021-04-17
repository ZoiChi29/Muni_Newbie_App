import 'package:easa/BedroomV3.dart';
import 'package:easa/ExteriorV3.dart';
import 'package:easa/LivingRoomV3.dart';
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

class Exterior2 extends StatefulWidget {
  @override
  _Exterior2State createState() => _Exterior2State();
}

class _Exterior2State extends State<Exterior2> {
  // TextField Controllers
  TextEditingController question5 = TextEditingController();
  TextEditingController question6 = TextEditingController();
  TextEditingController question7 = TextEditingController();
  TextEditingController question8 = TextEditingController();

//the keys
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();
  final _formKey8 = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

//entered values, might not need them
  String q5;
  String q6;
  String q7;
  String q8;

//from here we are setting the online DB.
  @override
  void initState() {
    super.initState();
    question5 = new TextEditingController();
    question6 = new TextEditingController();
    question7 = new TextEditingController();
    question8 = new TextEditingController();
  }

  void sendInfo() async {
    Uri url = Uri.parse(
        'https://muni2021.000webhostapp.com/login_flutter/Exterior.php');
    var data = {
      "question5": question5.text,
      "question6": question6.text,
      "question7": question7.text,
      "question8": question8.text,
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
        appBar: AppBar(title: Text("Exterior Sheet")),
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
                    "Ask owner if there are any sensors installed",
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
                    "Ask owner to show you irrigation system if any",
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
                    "Ask owner to show you water pumps if any",
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
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  Text(
                    "Ask owner to show you exterior envelope",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey8,
                    controller: question8,
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
                    padding: EdgeInsets.fromLTRB(250, 100, 0, 0),
                    child: RaisedButton(
                        child: Text(
                          "Next Page",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          sendInfo();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Exterior3()));
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
