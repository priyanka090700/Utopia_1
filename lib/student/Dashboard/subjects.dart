import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Subjects extends StatefulWidget {
  Subjects({Key key}) : super(key: key);
  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          color: Colors.blue[900],
          height: size.height,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Text(
                "NOTES ",
                textAlign: TextAlign.start,
                style:
                     GoogleFonts.pollerOne(
                      color: Colors.white, fontSize: 35.0),
              ),
              SizedBox(height: size.height * 0.05),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // Our background
                    Container(
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          
                        ),
                      ),
                    ),
                   ListView(
                     shrinkWrap: true,
                     children: <Widget>[
                            buildSubjectItem('assets/images/d1.jpg', 'Compiler Design'),
                            buildSubjectItem('assets/images/d1.jpg', 'Compiler Design'),
                            buildSubjectItem('assets/images/d1.jpg', 'Compiler Design'),
                            buildSubjectItem('assets/images/d1.jpg', 'Compiler Design'),
                            buildSubjectItem('assets/images/d1.jpg', 'Compiler Design'),
                            buildSubjectItem('assets/images/d1.jpg', 'Compiler Design'),
                            buildSubjectItem('assets/images/d1.jpg', ' Design'),
                            buildSubjectItem('assets/images/d1.jpg', ' Design'),


                          ]),]
                ),
              ),
            ],
          ),
        ))
    );
  } 
buildSubjectItem(String imgPath, String subjectName) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Row(
                children: [
                  CircleAvatar(
              backgroundImage: AssetImage(imgPath),
              radius: 30,
            ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subjectName,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  
                ],
              )),
             
            ],
          ),
          
        ));
  }
}
