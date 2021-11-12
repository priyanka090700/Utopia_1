
import 'package:Utopia_1/globals.dart';
import 'package:Utopia_1/teacher/Dashboard/Ebook/sub.dart';
import 'package:Utopia_1/teacher/Dashboard/Ebook/subject.dart';
import 'package:Utopia_1/teacher/Dashboard/Ebook/viewPDF.dart';


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EbookTeacher extends StatefulWidget {
  EbookTeacher({Key key}) : super(key: key);

  @override
  _EbookTeacherState createState() => _EbookTeacherState();
}

class _EbookTeacherState extends State<EbookTeacher> {
 List<Subject> itemList = List();
 String db; 
  @override
  void initState() {
    super.initState();
    if(Globals.sem == 5){
      if(Globals.branch =='cse'){
        db='Sem5CseEbook';
      }
    }
 if(Globals.sem == 6){
   if(Globals.branch =='cse'){
      db='Sem6CseEbook';}
 }
 final mainReference = FirebaseDatabase.instance.reference().child(db);
    mainReference.once().then((DataSnapshot snap) {
      var data = snap.value;
      itemList.clear();
      data.forEach((key, value) {
        Subject m = new Subject(value['PDF'], value['FileName']);
        itemList.add(m);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: Colors.blue[900],
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.05),
          Text(
            "EBOOKS",
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
              ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return buildSubjectItem('${itemList[index].subjectname}','${itemList[index].link}');
                  }),
              Positioned(
                bottom: size.height * 0.05,
                right: size.width * 0.05,
                child: FloatingActionButton(
                  backgroundColor: Colors.blue[900],
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewSubject(Subject('',"")),
                          fullscreenDialog: true),
                    );
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    )));
  }

  buildSubjectItem(String subjectName,String link) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.15,
                width: size.width * 0.94,
                child: Card(
                  color: Colors.lightBlueAccent[100],
                  elevation: 10,
                  shadowColor: Colors.blueGrey[100],
                  margin: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(subjectName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text("View",
                                style: GoogleFonts.acme(
                                    color: Colors.purple[700],
                                    fontSize: size.height * 0.025)),
                          ),
                          onTap: () {
                            String passData = link;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewPdf(),
                                    settings: RouteSettings(
                                      arguments: passData,
                                    )));
                          },
                        ),
                      ]),
                ),
              ),
            ],
          )),
    );
  }
}
