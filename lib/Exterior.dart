import 'package:easa/ExteriorV2.dart';
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

class Exterior extends StatefulWidget {
  @override
  _ExteriorState createState() => _ExteriorState();
}

class _ExteriorState extends State<Exterior> {
  // TextField Controllers
  TextEditingController question1 = TextEditingController();
  TextEditingController question2 = TextEditingController();
  TextEditingController question3 = TextEditingController();
  TextEditingController question4 = TextEditingController();

//the keys
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

//entered values, might not need them
  String q1;
  String q2;
  String q3;
  String q4;

//from here we are setting the online DB.
  @override
  void initState() {
    super.initState();
    question1 = new TextEditingController();
    question2 = new TextEditingController();
    question3 = new TextEditingController();
    question4 = new TextEditingController();
  }

  void sendInfo() async {
    Uri url = Uri.parse(
        'https://muni2021.000webhostapp.com/login_flutter/Exterior.php');
    var data = {
      "question1": question1.text,
      "question2": question2.text,
      "question3": question3.text,
      "question4": question4.text,
    };

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "true") {
    } else {
      //Fluttertoast.showToast(msg: "Error", toastLength: Toast.LENGTH_SHORT);
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
                    "Ask Owner to show you outdoor AC units",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey1,
                    controller: question1,
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
                    "Ask Owner to show you lighting fixtures",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey2,
                    controller: question2,
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
                    "Ask owner if they have information regarding the light fixtures wattage",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey3,
                    controller: question4,
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
                    "Ask owner if they have information regarding the light fixtures wattage",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey4,
                    controller: question4,
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
                                  builder: (context) => Exterior2()));
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
