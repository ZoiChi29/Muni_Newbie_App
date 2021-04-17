import 'package:easa/Bathroom.dart';
import 'package:easa/Bedroom.dart';
import 'package:easa/Exterior.dart';
import 'package:easa/HomePage.dart';
import 'package:easa/Kitchen.dart';
import 'package:easa/LivingRoom.dart';

import 'package:easa/PropertiesPage.dart';
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

class Rooms extends StatefulWidget {
  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  // TextField Controllers
  TextEditingController propName = TextEditingController();
  TextEditingController propType = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController yearofCon = TextEditingController();
  TextEditingController people = TextEditingController();
  TextEditingController floors = TextEditingController();
  TextEditingController livingrooms = TextEditingController();
  TextEditingController bedrooms = TextEditingController();
  TextEditingController bathrooms = TextEditingController();
  TextEditingController kitchens = TextEditingController();
  TextEditingController exteriors = TextEditingController();

  //the keys
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    propName = new TextEditingController();
    propType = new TextEditingController();
    location = new TextEditingController();
    area = new TextEditingController();
    yearofCon = new TextEditingController();
    people = new TextEditingController();
    floors = new TextEditingController();
    livingrooms = new TextEditingController();
    bedrooms = new TextEditingController();
    bathrooms = new TextEditingController();
    kitchens = new TextEditingController();
    exteriors = new TextEditingController();
  }

  /*void livroom() async {
    String choice = "Living Room";
    String Q1 = "1st question";
    String Q2 = "2nd question";
    var url = "https://muni2021.000webhostapp.com/login_flutter/Property.php";
    var data = {
      "choice": choice,
      "Q1": Q1,
      "Q2": Q2,
    };

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "true") {
      Fluttertoast.showToast(
          msg: "It is working", toastLength: Toast.LENGTH_SHORT);
    } else {
      Fluttertoast.showToast(
          msg: "didnt work", toastLength: Toast.LENGTH_SHORT);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Rooms Page"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(700.0, 20.0, 0.0, 20.0)),
          RaisedButton(
              child: Text("Generate a Sheet for Living Room"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => livingRoom()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0)),
          RaisedButton(
              child: Text("Generate a Sheet for Bedroom"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BedRoom()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0)),
          RaisedButton(
              child: Text("Generate a Sheet for Bathroom"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bathroom()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0)),
          RaisedButton(
              child: Text("Generate a Sheet for Kitchen"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Kitchen()))
                  }),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0)),
          RaisedButton(
              child: Text("Generate a Sheet for Exterior"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Exterior()))
                  }),
        ],
      ),
    );
  }
}
