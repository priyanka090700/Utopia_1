import 'dart:async';

import 'package:Utopia_1/teacher/Dashboard/Dates/FireStore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'dat.dart';
import 'addDate.dart';

class DatesTeacher extends StatefulWidget {
  DatesTeacher({Key key}) : super(key: key);

  @override
  _DatesTeacherState createState() => _DatesTeacherState();
}

class _DatesTeacherState extends State<DatesTeacher> {
  List<Task> items;
  FirestoreService fireServ = new FirestoreService();
  StreamSubscription<QuerySnapshot> todoTasks;

  @override
  void initState() {
    super.initState();

    items = new List();

    todoTasks?.cancel();
    todoTasks = fireServ.getTaskList().listen((QuerySnapshot snapshot) {
      final List<Task> tasks = snapshot.docs
          .map((documentSnapshot) => Task.fromMap(documentSnapshot.data()))
          .toList();

      setState(() {
        this.items = tasks;
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
            "IMPORTANT DATES",
            textAlign: TextAlign.center,
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
                    return buildSubjectItem(
                        '${items[index].taskname}',
                        '${items[index].taskdate}',
                        '${items[index].tasktime}',
                        '${items[index].taskdetails}');
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
                          builder: (context) => NewDate(Task('', '', '', '')),
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

  buildSubjectItem(
    String taskName,
    String taskDate,
    String taskTime,
    String taskDetail,
  ) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.20,
                width: size.width * 0.9,
                child: Card(
                  color: Colors.lightBlueAccent[100],
                  elevation: 20,
                  shadowColor: Colors.grey,
                  margin: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Text(taskName,
                          
                          style: GoogleFonts.staatliches(
                            color: Colors.black, fontSize: 27.0,decoration: TextDecoration.underline, letterSpacing: 1.0 ))
                    ),
                    Positioned(
                      top: 10.0,
                      right: 5.0,
                      child:Container(
                        
                        color: Colors.white,
                        height: size.height * 0.07,
                        width: size.width * 0.3,
                        child: Text(taskDate,
                        textAlign: TextAlign.right,
                          style: GoogleFonts.patuaOne(
                            color: Colors.black, fontSize: 20.0)),
                     ) ),
                    Positioned(
                      top: 46.0,
                      left: 10.0,
                      child: Container(
                        
                        height: size.height * 0.10,
                        width: size.width * 0.5,
                        child: Text(taskDetail,
                            
                            style: GoogleFonts.acme(
                            color: Colors.lightBlue[900], fontSize: 15.0)),
                      ),
                    ),
                    Positioned(
                      top: 35.0,
                      right: 10.0,
                      child: Text(taskTime,
                          
                          style: TextStyle(
                            color: Colors.grey[800],
                              fontSize: 15.0, )),
                    ),
                  ]),
                ),
              ),
            ],
          )),
    );
  }
}
