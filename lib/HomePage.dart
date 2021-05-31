//this is the 2nd page after a successful login.
//here the user will see the avaliable options and oprations to choose from.

//import 'dart:html';
import 'package:easa/PropertiesPage.dart';
import 'package:easa/PropertyRegistration.dart';
import 'package:easa/Uers_Pages/Users_Info.dart';
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
      //the following bs is to create a side menu.. pretty basic.
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
                leading: Icon(Icons.vpn_key),
                content: Text("Properties"),
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => properties()));
                }),
            MLMenuItem(
                leading: Icon(Icons.text_snippet_outlined),
                content: Text("Reports"),
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            MLMenuItem(
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

      //then we go to the body section...
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          //this button will take you to User_Info.dart. it was supposed to show the info of every user registerd in the DB.
          //however... we can list them only now... but we wanted to the user to be able to modify information as well..
          //sounded pretty complicated and hard to implement. faced many errors. so, we showed the users as list for now.
          RaisedButton(
              child: Text("Show Users Data"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Users_Info()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          //this button will tae you to the core of this app. the main idea behaind this app. 
          //where we can registar properties and generate sheets for each room.
          RaisedButton(
              child: Text("Properties"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => properties()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          //i am thinking to move this button till the end of the generating sheets in Rooms.dart. so it generate a full sheet for that specific property we just registered.
          //SUBJECT TO CHANGE.
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
