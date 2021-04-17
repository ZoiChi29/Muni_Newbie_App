//import 'dart:html';
import 'package:easa/PropertiesPage.dart';
import 'package:easa/PropertyRegistration.dart';
import 'package:easa/Users_Info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:validation_extensions/validation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MultiLevelDrawer(
          header: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
                "Can add almost anything here, picture of the user, Name...etc."),
          ),

          //we can add user photo here or any random thing...
          //height: size.height * 0.25,

          children: [
            MLMenuItem(
                //BTW, we can add sub menu in it... but i wont add them now :V
                leading: Icon(Icons.home),
                content: Text("Home"),
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            MLMenuItem(
                //BTW, we can add sub menu in it... but i wont add them now :V
                leading: Icon(Icons.vpn_key),
                content: Text("Properties"),
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => properties()));
                }),
            MLMenuItem(
                //BTW, we can add sub menu in it... but i wont add them now :V
                leading: Icon(Icons.text_snippet_outlined),
                content: Text("Reports"),
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            MLMenuItem(
                //BTW, we can add sub menu in it... but i wont add them now :V
                leading: Icon(Icons.power_settings_new),
                content: Text("Log out"),
                onClick: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
          ]),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          RaisedButton(
              child: Text("Show Users Data"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Users_Info()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          RaisedButton(
              child: Text("Properties"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => properties()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          RaisedButton(
              child: Text("Generate A Report"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {}),
        ],
      ),
    );
  }
}
