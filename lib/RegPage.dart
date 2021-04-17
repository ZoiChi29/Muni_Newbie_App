//import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:validation_extensions/validation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  // TextField Controllers
  TextEditingController emiratesidController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

//the keys
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

//entered values, might not need them
  String emiratesid;
  String firstname;
  String lastname;
  String dob;
  String phone;
  String mobile;
  String email;

//from here we are setting the online DB.
  @override
  void initState() {
    super.initState();
    emiratesidController = new TextEditingController();
    firstnameController = new TextEditingController();
    lastnameController = new TextEditingController();
    dobController = new TextEditingController();
    phoneController = new TextEditingController();
    mobileController = new TextEditingController();
    emailController = new TextEditingController();
    passwordcontroller = new TextEditingController();
  }

  void registerUser() async {
    Uri url = Uri.parse(
        'https://muni2021.000webhostapp.com/login_flutter/regpage.php');
    var data = {
      "eid": emiratesidController.text,
      "firstname": firstnameController.text,
      "lastname": lastnameController.text,
      "dob": dobController.text,
      "phone": phoneController.text,
      "mobile": mobileController.text,
      "email": emailController.text,
      "password": passwordcontroller.text,
    };

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "account already exists") {
      Fluttertoast.showToast(
          msg: "account exists, please login insted",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      if (jsonDecode(res.body) == "true") {
        Fluttertoast.showToast(
            msg: "account created", toastLength: Toast.LENGTH_SHORT);
      } else {
        Fluttertoast.showToast(msg: "error", toastLength: Toast.LENGTH_SHORT);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Registration Page"),
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
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        controller: emiratesidController,
                        decoration: InputDecoration(
                          labelText: "Emirates ID",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                        ),
                        keyboardType: TextInputType.number,
                        //the field validator
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required Field"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        controller: firstnameController,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                        ),
                        keyboardType: TextInputType.name,
                        //the field validator
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required Field"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        controller: lastnameController,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                        ),
                        keyboardType: TextInputType.name,
                        //the field validator
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required Field"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        controller: dobController,
                        decoration: InputDecoration(
                          labelText: "Date Of Birth",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                        ),
                        keyboardType: TextInputType.datetime,
                        //the field validator
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required Field"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: "Phone",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                        ),

                        keyboardType: TextInputType.phone,
                        // the text validator
                        validator: MultiValidator([
                          MaxLengthValidator(9,
                              errorText: "Invalid Phone Number"),
                          RequiredValidator(errorText: "Required Field"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        controller: mobileController,
                        decoration: InputDecoration(
                          labelText: "Mobile",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                        ),

                        keyboardType: TextInputType.phone,
                        // the text validator
                        validator: MultiValidator([
                          MaxLengthValidator(10,
                              errorText: "Invalid Mobile Number"),
                          RequiredValidator(errorText: "Required Field"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        // the validator
                        validator: MultiValidator([
                          EmailValidator(errorText: "Not A Valid Email"),
                          RequiredValidator(errorText: "Required Field"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          labelText: "Password",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        // the field validator
                        validator: MultiValidator([
                          MaxLengthValidator(15,
                              errorText:
                                  "Password Shouldn't be More Than 15 Charecters"),
                          MinLengthValidator(6,
                              errorText:
                                  "Password Shouldn't be Less Than 6 Charecters"),
                          RequiredValidator(errorText: "Required Field"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: RaisedButton(
                          child: Text(
                            "Registar",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            registerUser();
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegPage()));
                          }),
                    )
                  ],
                ),
              ),
            )));
  }
}
