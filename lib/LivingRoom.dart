import 'package:easa/LivingRoomV2.dart';
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

class livingRoom extends StatefulWidget {
  @override
  _livingRoomState createState() => _livingRoomState();
}

class _livingRoomState extends State<livingRoom> {
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
                    "Ask Owner to show you AC in the room",
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
                    "Ask owner to show you AC label",
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
                    "Ask owner to zoom in to the AC grills",
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
                    "Ask Owner to show you AC controller",
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
                    "Ask Owner to show you fans and portable AC units in the room",
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
                    padding: EdgeInsets.fromLTRB(250, 50, 0, 0),
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
                                  builder: (context) => livingRoom2()));
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
