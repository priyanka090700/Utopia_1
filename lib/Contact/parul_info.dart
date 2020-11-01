import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParulInfo extends StatefulWidget {
  ParulInfo({Key key}) : super(key: key);

  @override
  _ParulInfoState createState() => _ParulInfoState();
}

class _ParulInfoState extends State<ParulInfo> {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      color: Colors.blue[900],
      child: Stack(children: <Widget>[
        Positioned(
            top: size.height*0.3,
            left: size.width*0.1,
            child: Container(
                height: size.height*0.5,
                width: size.width*0.8,
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.blueAccent,
                  margin: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 80),
                      child: Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Parul Tholia',
                                style: GoogleFonts.acme(
                                    color: Colors.blue, fontSize:  size.height*0.03,)),
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
                                    color: Colors.black, fontSize:  size.height*0.018,)),
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
                                    color: Colors.black, fontSize:  size.height*0.018,)),
                          ],
                        ),
                        Row(
                          children: [Text("")],
                        ),
                      ])),
                ))),
        Positioned(
            top: size.height*0.20,
            right: size.width*0.35,
            child: Container(
              height: size.width*0.3,
              width: size.width*0.3,
              child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 80,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/parul.jpg"),
                  )),
            )),
      ]),
    ));
  }
}
