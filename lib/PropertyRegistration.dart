import 'package:easa/HomePage.dart';
import 'package:easa/PropertiesPage.dart';
import 'package:easa/Rooms.dart';
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

class propreg extends StatefulWidget {
  @override
  _propregState createState() => _propregState();
}

class _propregState extends State<propreg> {
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

  /*entered values, might not need them
  String propname;
  String proptype;
  String _location;
  String _area;
  String year_of_con;
  String _people;
  String _floors;*/

  @override
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

  void registerProperty() async {
    Uri url = Uri.parse("https://muni2021.000webhostapp.com/login_flutter/Property.php");
    var data = {
      "Property_Name": propName.text,
      "Property_Type": propType.text,
      "Location": location.text,
      "Area": area.text,
      "Year_Of_Construction": yearofCon.text,
      "People": people.text,
      "Floors": floors.text,
      "Number_Of_Living_Rooms": livingrooms.text,
      "Number_Of_Bedrooms": bedrooms.text,
      "Number_Of_Bathrooms": bathrooms.text,
      "Number_Of_Kitchens": kitchens.text,
      "Number_Of_Exterior": exteriors.text,
    };

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "Property Already Exists") {
      Fluttertoast.showToast(
          msg: "Property Already Exists", toastLength: Toast.LENGTH_SHORT);
    } else {
      if (jsonDecode(res.body) == "true") {
        Fluttertoast.showToast(
            msg: "Property Added", toastLength: Toast.LENGTH_SHORT);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Rooms()));
      } else {
        Fluttertoast.showToast(msg: "Error", toastLength: Toast.LENGTH_SHORT);
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Property Registration Page"),
        ),
        body: Form(
            autovalidate: true,
            key: _formKey,
            child: Container(
                child: SingleChildScrollView(
                    //THIS LINE IS SOOOOO DAM IMPORTANT WTF
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: propName,
                      decoration: InputDecoration(
                        labelText: "Property Name",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                      keyboardType: TextInputType.text,
                      //the field validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: propType,
                      decoration: InputDecoration(
                        labelText: "Property Type",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                      keyboardType: TextInputType.text,
                      //the field validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: location,
                      decoration: InputDecoration(
                        labelText: "Location",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                      keyboardType: TextInputType.text,
                      //the field validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: area,
                      decoration: InputDecoration(
                        labelText: "Area",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                      keyboardType: TextInputType.text,
                      //the field validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: yearofCon,
                      decoration: InputDecoration(
                        labelText: "Year of Construction",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),

                      keyboardType: TextInputType.number,
                      // the text validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: people,
                      decoration: InputDecoration(
                        labelText: "Number of People",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),

                      keyboardType: TextInputType.number,
                      // the text validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: floors,
                      decoration: InputDecoration(
                        labelText: "Number of Floors",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),
                      keyboardType: TextInputType.number,
                      // the validator
                      validator: MultiValidator([
                        //EmailValidator(errorText: "Not A Valid Email"),
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: livingrooms,
                      decoration: InputDecoration(
                        labelText: "No. Of Living Rooms",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),

                      keyboardType: TextInputType.number,
                      // the text validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: bedrooms,
                      decoration: InputDecoration(
                        labelText: "No. Of Bedrooms",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),

                      keyboardType: TextInputType.number,
                      // the text validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: bathrooms,
                      decoration: InputDecoration(
                        labelText: "No. Of Bathrooms",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),

                      keyboardType: TextInputType.number,
                      // the text validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: kitchens,
                      decoration: InputDecoration(
                        labelText: "No. Of Kitchens",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),

                      keyboardType: TextInputType.number,
                      // the text validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: TextFormField(
                      controller: exteriors,
                      decoration: InputDecoration(
                        labelText: "No. Of Exterior",
                        enabledBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                      ),

                      keyboardType: TextInputType.number,
                      // the text validator
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Field"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: RaisedButton(
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          registerProperty();
                        }),
                  )
                ])))));
  }
}
