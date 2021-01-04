import 'package:Utopia_1/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TeacherBody extends StatefulWidget {
  TeacherBody({Key key}) : super(key: key);

  @override
  _TeacherBodyState createState() => _TeacherBodyState();
}

class _TeacherBodyState extends State<TeacherBody> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        bottom: false,
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height:size.height*0.05),
              Text(
                "UTOPIA ",
                textAlign: TextAlign.start,
                style:
                     GoogleFonts.patuaOne(
                      color: Colors.white, fontSize: 35.0),
              ),
              Text(
                "For a better tomorrow.",
                textAlign: TextAlign.start,
                style:
                     GoogleFonts.satisfy(
                      color: Colors.white, fontSize: 25.0),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // Our background
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                   GridView. count(
                     scrollDirection: Axis.horizontal,
                     crossAxisCount: 2,
                     childAspectRatio: 1.5,
                  
                  children:<Widget> [
        buildListItem('assets/images/notice.png','Notices & \nCirculars','\teachernotice',1),
        buildListItem('assets/images/calendar.png','Important \nDates','\teacherdate',2),
        buildListItem('assets/images/notes.png','Notes','\teachersem',3),
        buildListItem('assets/images/syllabus.png','Syllabus','\teachersem',4),
        buildListItem('assets/images/timetable.png','Time Table','\teachersem',5),
        buildListItem('assets/images/papers.png','Practice \nPapers','\teachersem',6),
        buildListItem('assets/images/ebook.png','E-Books','\teachersem',7),
        buildListItem('assets/images/event.png','Events','\teacherevent',8),
        buildListItem('assets/images/attendence.png','Attendance','\teachersem',9),
        buildListItem('assets/images/Contact.png','Contact Us','\contact',10),

        
      ]
                   ),]
                ),
              ),
            ],
          ),
        ));
  }

  buildListItem(String imgPath,String name,String path,int select) {
    Size size = MediaQuery.of(context).size;
    
    return Padding(
      padding: EdgeInsets.only(left:20.0),
      child: GestureDetector(
      onTap: () {
        afterpage(select);
                Navigator.of(context).pushNamed(path);
              },
              child: Stack(
                children: <Widget>[
                  
                  Positioned(
                    top: 50.0,
                    child: Container(
                      height:size.height*0.25,
                      width:size.height*0.20 ,
        
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color:Colors.grey,
                          blurRadius: 20.0,
                          spreadRadius: 3.0,
                          offset: Offset(10.0, 10.0))],
                        borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/d1.jpg'),
                          fit: BoxFit.cover
                        )
                      )
                    )
                  ),
                  
                  Positioned(
                    top: 30.0,
                    left: 3.0,
                    child: Hero(
                      tag: imgPath,
                      child: Container(
                        height:size.height*0.15,
                        width:size.height*0.15,
                      
                        child: Image(image: AssetImage(imgPath), fit:BoxFit.scaleDown)
                      )
                    )
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 50.0,
                    child: Text(
                          name,
                          style: GoogleFonts.acme(
                              color: Colors.black, fontSize: 25.0),
                        ),
                  ),
                  
                ],
              )
            ),
              );
          }
        
          void afterpage(int x) {
            Globals.select=x;
          }
}
