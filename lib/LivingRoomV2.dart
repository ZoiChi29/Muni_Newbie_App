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

class livingRoom2 extends StatefulWidget {
  @override
  _livingRoom2State createState() => _livingRoom2State();
}

class _livingRoom2State extends State<livingRoom2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Living Room Sheet")),
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
                    "Ask Owner to show you lighting fixtures in the room",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  //padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
                  TextFormField(
                    //controller: question1,
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
                    "Ask owner if they have information regarding the light fixtures wattage in the room",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  //padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
                  TextFormField(
                    //controller: question1,
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
                    "Ask owner to show you windows and blinds in the room",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  //padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
                  TextFormField(
                    //controller: question1,
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
                    "Ask owner if there are any sensors installed",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                  //padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
                  TextFormField(
                    //controller: question1,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => livingRoom3()));
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
