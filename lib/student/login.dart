import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginStudent extends StatefulWidget {
  LoginStudent({Key key}) : super(key: key);

  @override
  _LoginStudentState createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  String email;
  String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Container(
        color:Colors.blue[100],
        height: size.height,
        width: double.infinity,
        child: Center(
            child: Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'LOG IN',
                      style: GoogleFonts.pollerOne(
                          color: Colors.blue[900], fontSize: 25.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Username'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter Some Text";
                        }
                        if (value.contains('@utopia') ){
                          return null;
                        }else{
                          return "Invalid Email";
                        }
                        
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter Some Text";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        if(_formKey.currentState.validate()){
                          login();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: Text(
                          'LOG IN',
                          style: GoogleFonts.acme(
                              color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    )));
  }

  void login() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacementNamed('\studash');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('No user for that username'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      } else if (e.code == 'wrong-password') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('The password was incorrect, please try again'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    }
  }
}
