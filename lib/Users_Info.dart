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

class Users_Info extends StatefulWidget {
  @override
  _Users_InfoState createState() => _Users_InfoState();
}

class _Users_InfoState extends State<Users_Info> {
  /*Future getData() async {
    Uri url =Uri.parse('https://muni2021.000webhostapp.com/login_flutter/viewcontact.php');
    var response = await http.get(url);
    
    if (jsonDecode(response.body) == "nothing here"){
     Fluttertoast.showToast(
       msg: "no no", toastLength: Toast.LENGTH_SHORT);
    } else {
      if (jsonDecode(response.body)=="true") {
        jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: "ok we are in", toastLength: Toast.LENGTH_SHORT);
      }
    }   

  }*/

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
                      MaterialPageRoute(builder: (context) => Users_Info()));
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
                      MaterialPageRoute(builder: (context) => Users_Info()));
                }),
            MLMenuItem(
                //BTW, we can add sub menu in it... but i wont add them now :V
                leading: Icon(Icons.power_settings_new),
                content: Text("Log out"),
                onClick: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => Users_Info()));
                }),
          ]),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: UserList(),
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

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class User {
  String fullname, email;
  String eid;

  User(this.fullname, this.email, this.eid);
  User.fromJson(Map<String, dynamic> json)
      : fullname = json['firstname'] + ' ' + json['lastname'],
        eid = json['eid'];
  //email =json['email'];

}

class _UserListState extends State<UserList> {
  bool loading;

  List<User> users;

  void initState() {
    users = [];
    loading = true;

    _loadUser();
    super.initState();
  }

  void _loadUser() async {
    Uri url = Uri.parse(
        'https://muni2021.000webhostapp.com/login_flutter/viewcontact.php');
    final response = await http.get(url);
    final json = jsonDecode(response.body);

    //coverting into string
    //String jsonsDataString = json.toString();
    //final jsonData = jsonDecode(jsonsDataString); NOO NEED for this

    List<User> _users = [];
    for (var jsonUser in json) {
      _users.add(User.fromJson(jsonUser));
    }
    setState(() {
      users = _users;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].fullname),
          subtitle: Text(users[index].eid),
          leading: Icon(Icons.supervised_user_circle),
        );
      },
      itemCount: users.length,
    );
  }
}
