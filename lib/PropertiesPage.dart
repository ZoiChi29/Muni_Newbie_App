import 'package:easa/HomePage.dart';
import 'package:easa/PropertyRegistration.dart';
import 'package:flutter/material.dart';
//import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:validation_extensions/validation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class properties extends StatefulWidget {
  @override
  _propertiesState createState() => _propertiesState();
}

class _propertiesState extends State<properties> {
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
                onClick: () {}),
            MLMenuItem(
                //BTW, we can add sub menu in it... but i wont add them now :V
                leading: Icon(Icons.power_settings_new),
                content: Text("Log out"),
                onClick: () {}),
          ]),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Properties Page"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(12.0)),
          RaisedButton(
              child: Text("Registar a new property"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => propreg()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          RaisedButton(
              child: Text("Show Properties Data"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {}),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0)),
        ],
      ),
    );
  }
}
