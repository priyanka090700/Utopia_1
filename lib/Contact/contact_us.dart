import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// This is the stateless widget that the main application instantiates.
class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.blue[900],
        child: Stack(children: <Widget>[
          Positioned(
              top: size.height*0.05,
              left: 20,
              child: Row(
                children: <Widget>[
                  Text("About App",
                      style: GoogleFonts.lobster(
                          color: Colors.white, fontSize: size.height*0.04)),
                ],
              )),
          Positioned(
              top: size.height*0.13,
              child: Container(
                  height: size.height*0.25,
                  width: size.width*0.9,
                  color: Colors.blue[900],
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, ),
                      child: Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Utopia: For a better tomorrow',
                                style: GoogleFonts.acme(
                                    color: Colors.white, fontSize: size.height*0.035)),
                          ],
                        ),
                        Row(
                          children: <Widget>[Text("")],
                        ),
                        Row(
                          children: <Widget>[
                            Text('     This is an app....',
                                style: GoogleFonts.acme(
                                    color: Colors.white, fontSize: size.height*0.03)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.only(top: 5.0, left: 20),
                                child: Text("Know More ->",
                                    style: GoogleFonts.acme(
                                        color: Colors.yellow[200],
                                        fontSize: size.height*0.02)),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed('\appinfo');
                              },
                            ),
                          ],
                        ),
                      ])))),
          Positioned(
              top: size.height*0.3,
              left: 20,
              child: Row(
                children: <Widget>[
                  Text("About Contributors",
                      style: GoogleFonts.lobster(
                          color: Colors.white, fontSize: size.height*0.04)),
                ],
              )),
          Positioned(
              top: size.height*0.35,
              left:size.width*0.05,
              child: Container(
                  height: size.height*0.25,
                  width: size.width*0.9,
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.blueAccent,
                    margin: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.0, top:10),
                        child: Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Priyanka Lodhi',
                                  style: GoogleFonts.acme(
                                      color: Colors.blue, fontSize: size.height*0.04)),
                            ],
                          ),
                          Row(
                            children: [Text("")],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.call,
                                color: Colors.black,
                                size: 25.0,
                              ),
                              Text(' 9870953344',
                                  style: GoogleFonts.acme(
                                      color: Colors.black, fontSize: size.height*0.018)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.mail,
                                color: Colors.black,
                                size: 25.0,
                              ),
                              Text(' lodhipriyanka907@gmail.com',
                                  style: GoogleFonts.acme(
                                      color: Colors.black, fontSize: size.height*0.018)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text("Know More ->",
                                      style: GoogleFonts.acme(
                                          color: Colors.purple,
                                          fontSize: size.height*0.03)),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('\priyankainfo');
                                },
                              ),
                            ],
                          ),
                        ])),
                  ))),
          Positioned(
              top: size.height*0.4,
              right: size.width*0.1,
              child: Container(
                height: size.height*0.13,
                width: size.height*0.13,
                child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 60.0,
                    child: CircleAvatar(
                      radius: 57.0,
                      backgroundImage: AssetImage("assets/images/priyanka.jpg"),
                    )),
              )),
          Positioned(
              top: size.height*0.6,
              left:size.width*0.05,
              child: Container(
                  height: size.height*0.25,
                  width: size.width*0.9,
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.blueAccent,
                    margin: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 10),
                        child: Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Parul Tholia',
                                  style: GoogleFonts.acme(
                                      color: Colors.blue, fontSize: size.height*0.04)),
                            ],
                          ),
                          Row(
                            children: [Text("")],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.call,
                                color: Colors.black,
                                size: 25.0,
                              ),
                              Text(' 8929849741',
                                  style: GoogleFonts.acme(
                                      color: Colors.black, fontSize: size.height*0.018)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.mail,
                                color: Colors.black,
                                size: 25.0,
                              ),
                              Text(' tholiaparul269@gmail.com',
                                  style: GoogleFonts.acme(
                                      color: Colors.black, fontSize: size.height*0.018)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text("Know More ->",
                                      style: GoogleFonts.acme(
                                          color: Colors.purple,
                                          fontSize: size.height*0.03)),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed('\parulinfo');
                                },
                              ),
                            ],
                          ),
                        ])),
                  ))),
          Positioned(
              top: size.height*0.65,
              right: size.width*0.1,
              child: Container(
                height: size.height*0.13,
                width: size.height*0.13,
                child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 60,
                    child: CircleAvatar(
                      radius: 57.0,
                      backgroundImage: AssetImage("assets/images/parul.jpg"),
                    )),
              )),
          Positioned(
            bottom: size.height*0.05,
            right: size.width*0.1,
            child: InkWell(
              onTap: () {
                logout();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: Text(
                  'LOG OUT',
                  style:
                      GoogleFonts.acme(color: Colors.blue[900], fontSize: 20.0),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamed('\home');
  }
}
