import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInfo extends StatefulWidget {
  AppInfo({Key key}) : super(key: key);

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
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
                            Text('Utopia: For a better tomorrow',
                                style: GoogleFonts.acme(
                                    color: Colors.blue, fontSize: size.height*0.03,)),
                          ],
                        ),
                        Row(
                          children: [Text("")],
                        ),
                        Row(
                          children: <Widget>[
                            Text(' This app is ...',
                                style: GoogleFonts.acme(
                                    color: Colors.blue, fontSize: size.height*0.018)),
                          ],
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
                    backgroundImage: AssetImage("assets/images/logo.png"),
                  )),
            )),
      ]),
    ));
  }
}
