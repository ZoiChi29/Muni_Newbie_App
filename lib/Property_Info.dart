//import 'dart:html';
import 'package:easa/PropertiesPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:validation_extensions/validation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Property_Info extends StatefulWidget {
  @override
  _Property_InfoState createState() => _Property_InfoState();
}

class _Property_InfoState extends State<Property_Info> {
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
                leading: Icon(Icons.home),
                content: Text("Home"),
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Property_Info()));
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
                      MaterialPageRoute(builder: (context) => Property_Info()));
                }),
            MLMenuItem(
                leading: Icon(Icons.power_settings_new),
                content: Text("Log out"),
                onClick: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => Property_Info()));
                }),
          ]),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Properties"),
      ),
      body: PropertyList(),
    );

    //FutureBuilder(
    //future: getData(),

    /*builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListView.builder(
                  //itemCount: snapshot.data.lenght,
                  itemBuilder: (context, index) {
                  List list = snapshot.data;
                  return ListTile(
                    title: Text(list[index]['eid']['firstname']['lastname']
                        ['dob']['phone']['mobile']['email']['password']),
                  );
                })
              : Center(
                  child: CircularProgressIndicator(),
                );
        },*/
  }
}

//UserListApp();

class PropertyList extends StatefulWidget {
  @override
  _PropertyListState createState() => _PropertyListState();
}

class Property {
  String propertyname, type;
  String year;

  Property(this.propertyname, this.type, this.year);
  Property.fromJson(Map<String, dynamic> json)
      : propertyname = json['Property_Name'],
        type = json['Property_Type'],
        year = json['Location'];
  //email =json['email'];

}

class _PropertyListState extends State<PropertyList> {
  bool loading;

  List<Property> Propertys;

  void initState() {
    Propertys = [];
    loading = true;

    _loadProperty();
    super.initState();
  }

  void _loadProperty() async {
    Uri url = Uri.parse(
        'https://muni2021.000webhostapp.com/login_flutter/viewproperty.php');
    final response = await http.get(url);
    final json = jsonDecode(response.body);

    List<Property> _Propertys = [];
    for (var jsonProperty in json) {
      _Propertys.add(Property.fromJson(jsonProperty));
    }
    setState(() {
      Propertys = _Propertys;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(Propertys[index].propertyname),
          subtitle: Text(Propertys[index].type),
          //isThreeLine: Text(Propertys[index].year),
          leading: Icon(Icons.home_outlined),
          dense: true,
          trailing: Icon(Icons.view_headline),
        );
      },
      itemCount: Propertys.length,
    );
  }
}
