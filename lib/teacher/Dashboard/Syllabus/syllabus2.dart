import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FireStore.dart';
import 'sub.dart';
import 'subject.dart';

class SyllabusTeacher extends StatefulWidget {
  SyllabusTeacher({Key key}) : super(key: key);

  @override
  _SyllabusTeacherState createState() => _SyllabusTeacherState();
}

class _SyllabusTeacherState extends State<SyllabusTeacher> {
  List<Subject> items;
  FirestoreService fireServ = new FirestoreService();
  StreamSubscription<QuerySnapshot> subjectList;

  @override
  void initState() {
    super.initState();

    items = new List();

    subjectList?.cancel();
    subjectList = fireServ.getSubjectList().listen((QuerySnapshot snapshot) {
      final List<Subject> subject = snapshot.docs
          .map((documentSnapshot) => Subject.fromMap(documentSnapshot.data()))
          .toList();

      setState(() {
        this.items = subject;
      });
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
            "SYLLABUS",
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return buildSubjectItem('${items[index].subjectname}');
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
                          builder: (context) => NewSubject(Subject('')),
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

  buildSubjectItem(String subjectName) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                
                height: size.height*0.15,
                  width: size.width*0.94,
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
                                  child: Text("Download",
                                      style: GoogleFonts.acme(
                                          color: Colors.purple[700],
                                          fontSize: size.height*0.025)),
                                ),
                                onTap: () {
                                  
                                },
                              ),
                        ] 
                      ),
                    ),
              ),
            ],
          )),
    );
  }
}
