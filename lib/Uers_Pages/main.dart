//This is the VERY 1ST page. where i have the login page. and the intro to registration page via the button registar.
// we have the button login here as well.. in case the info are correct. the user will move to the next page which is HomePage.dart
//the order of the pages : Main, HomePgae: User_Info,PropertiesPage,Then Rooms. inside rooms you have the living room with the three versions + bedrooms...etc.

//import 'dart:html';
import 'dart:convert';
import 'package:easa/Rooms/Bedroom.dart';
import 'package:easa/HomePage.dart';
import 'package:easa/Rooms/LivingRoom.dart';
import 'package:easa/Property_Info.dart';
import 'package:easa/Uers_Pages/RegPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session/flutter_session.dart';

//here we the app starts. the next fun is responsble for the app turning on. just leave it.. its a default thingy
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //dynamic token = FlutterSession().get("token");
  runApp(MyApp());
}

//this class is for the app name and deciding the home page of the app. ya3ni when it opens... what page it will open 1st.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "EASA",
        home: new LoginPage(),
        theme: new ThemeData(
          //primarySwatch: Colors.blue),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
} //TO ANIMATE THE LOGO "with SingleTickerProviderStateMixin"

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController controller =
      new TextEditingController(); //For the navigator
  AnimationController iconAnimationController;
  Animation<double> iconAnimation;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//all text editing controllers are responsble for communicating with the DB via the php we have in PHPMYADMIN.
//you will find them used down there in the forms when requesting inputs from the user
  TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();

  //Animation FUNCTION. was trying some fancy sh1t.. by making the icon animate when u open the app. not important tho.

  @override
  void initState() {
    super.initState();
    emailctrl = new TextEditingController();
    passwordctrl = new TextEditingController();
    iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 70));
    iconAnimation = new CurvedAnimation(
        parent: iconAnimationController, curve: Curves.slowMiddle);

    iconAnimation.addListener(() => this.setState(() {}));
    iconAnimationController.forward();
  }
// TILL HERE...
//next the login fun. where we send the info inside the controllers to the PHP file we have in phpmyadmin

  Future userSignIn() async {
    Uri url =
        Uri.parse("https://muni2021.000webhostapp.com/login_flutter/login.php");
    var data = {
      "email": emailctrl.text,
      "password": passwordctrl.text,
    };
    var res = await http.post(url, body: data);

    if (json.decode(res.body) == "Invalid Email") {
      Fluttertoast.showToast(
          msg: "Not exists Account, Registar first please",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      if (json.decode(res.body) == "Wrong Password") {
        Fluttertoast.showToast(
            //gravity: ToastGravity.CENTER,
            msg: "incorrect password",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        if (json.decode(res.body) == "Success") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        //print(jsonDecode(res.body));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          //appbar just the blue thingy up there
          title: Text("Welcome To EASA"),
        ),
        //here finished appbar
        //now we move into the BODY we used stack just we can expand the picture to fit the whole page
        body: new Stack(
          fit: StackFit.expand,
          //then using childern list to add more things.
          children: <Widget>[
            //the opacity widget to make the background picture dark
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/rak.jpg",
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            //Opacity finished here.
            //new column to add more things like logo and text input.
            SingleChildScrollView(
              child: new Column(
                //this line to make the colom start from the middle of the page, not from top
                //mainAxisAlignment: MainAxisAlignment.center, // WE CHANGED IT TO
                children: <Widget>[
                  new FlutterLogo(
                    // we are using here the default flutter icon.. can be changed
                    //HERE WE APPLY THE VALUE FROM 0 TO 1. THEN MULTY by 100. 0.8*100 FOR EXAMPLE
                    size: iconAnimation.value * 70,
                  ),
                  //HERE WE WILL ADD ANOTHER COLOM TO BE ABLE TO HAVE MULTI TEXT FIELDS UNDER EACH OTHER.
                  //SO, in the form we have coulmn, in the colom we have many childern.
                  new Form(
                    key:
                        _formkey, //keys are very important for the controllers it seems. so we will have them in each form when we need inputs from the user
                    //HERE WE ADDED THEME TO MAKE THE TEXT A LIL BIT BRIGHTER
                    child: Theme(
                      data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ))),
                      child: new Container(
                        padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new TextFormField(
                              controller: emailctrl,
                              //TO PUT BORDERS AND INPUT
                              decoration: new InputDecoration(
                                labelText: "Email",
                                //enabledBorder: OutlineInputBorder(),
                                //border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            //NOW FOR THE PASSWORD
                            new TextFormField(
                              controller: passwordctrl,
                              decoration: new InputDecoration(
                                labelText: "Password",
                              ),
                              keyboardType: TextInputType.text,
                              //to make the password look like this "******"
                              obscureText: true,
                            ),
                            //END OF TEXT FEILDS, USERNAME AND PASSWORD
                            //NOW, JUST TO MAKE A SMALL SPACE BETWEEN THE TEXT AND THE LOGIN BUTTON
                            new Padding(
                                padding: const EdgeInsets.only(top: 20)),
                            //THEN WE CUSTOMIZE THE LOGIN BUTTON.
                            new MaterialButton(
                              minWidth: 200.0,
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: new Text("Login"),
                              onPressed: () {
                                userSignIn();
                              },
                            ),

                            new Padding(
                                padding: const EdgeInsets.only(top: 20)),
                            //NOW WE WILL ADD THE LINK TO THE REGISTRATION PAGE HERE
                            new MaterialButton(
                              minWidth: 200.0,
                              child: Text("Registar"),
                              color: Colors.teal,
                              textColor: Colors.white,
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => livingRoom()))
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
                //finished the childern list after the logo.
              ),
            )
          ],
        )
        /*Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/rak.jpg"),
                    fit: BoxFit.fill,
                    colorFilter:
                        ColorFilter.mode(Colors.white10, BlendMode.darken))
                        )
                        ),*/
        //new Column( children: <Widget>[])

        // new Column(children: <Widget>[
        /*new Image(
            image: new AssetImage("assets/rak.jpg"),
            fit: BoxFit.cover,
          )*/
        /*new Container(
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage("assets/rak.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),*/
        );
  }
}
