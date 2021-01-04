import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticeTeacher extends StatefulWidget {
  @override
  _NoticeTeacherState createState() => _NoticeTeacherState();
}

class _NoticeTeacherState extends State<NoticeTeacher>{
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.blue[900],
          width: size.width,
          height: size.height,
          child: Column(children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Text(
              "NOTICES ",
              textAlign: TextAlign.start,
              style: GoogleFonts.pollerOne(color: Colors.white, fontSize: 35.0),
            ),
            SizedBox(height: size.height * 0.05),
            Expanded(
              child: Stack(children: <Widget>[
                // Our background
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                bottom: size.height * 0.5,
                right: size.width * 0.25,
                child: Text(
              "Coming Soon... ",
              textAlign: TextAlign.start,
              style: GoogleFonts.satisfy( color: Colors.black, fontSize: 35.0),
              )
              ),
              ]),
            ),
          ])),
    ));
  }
}


