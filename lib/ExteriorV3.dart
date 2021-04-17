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

class Exterior3 extends StatefulWidget {
  @override
  _Exterior3State createState() => _Exterior3State();
}

class _Exterior3State extends State<Exterior3> {
  // TextField Controllers
  TextEditingController question9 = TextEditingController();
  TextEditingController question10 = TextEditingController();
  TextEditingController question11 = TextEditingController();

//the keys
  final _formKey9 = GlobalKey<FormState>();
  final _formKey10 = GlobalKey<FormState>();
  final _formKey11 = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

//entered values, might not need them
  String q9;
  String q10;
  String q11;

//from here we are setting the online DB.
  @override
  void initState() {
    super.initState();
    question9 = new TextEditingController();
    question10 = new TextEditingController();
    question11 = new TextEditingController();
  }

  void sendInfo() async {
    Uri url = Uri.parse(
        'https://muni2021.000webhostapp.com/login_flutter/Exterior.php');
    var data = {
      "question9": question9.text,
      "question10": question10.text,
      "question11": question11.text,
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
                    "Ask owner if there is a swimming pool",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey9,
                    controller: question9,
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
                    key: _formKey10,
                    controller: question10,
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
                    "Ask owner to show you the roof",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    key: _formKey11,
                    controller: question11,
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
