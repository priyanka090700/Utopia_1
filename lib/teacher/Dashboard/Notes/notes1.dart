import 'package:Utopia_1/globals.dart';
import 'package:Utopia_1/teacher/Dashboard/Notes/newsub.dart';
import 'package:Utopia_1/teacher/Dashboard/Notes/sub.dart';
import 'package:Utopia_1/teacher/Dashboard/Notes/units.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesTeacher extends StatefulWidget {
  NotesTeacher({Key key}) : super(key: key);

  @override
  _NotesTeacherState createState() => _NotesTeacherState();
}

class _NotesTeacherState extends State<NotesTeacher> {
  List<Subject> itemList = List();
  String db;

  @override
  void initState() {
    super.initState();
    if (Globals.sem == 5) {
      if (Globals.branch == 'cse') {
        db = 'Sem5CseNotes';
      }
    }
    if (Globals.sem == 6) {
      if (Globals.branch == 'cse') {
        db = 'Sem6CseNotes';
      }
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
            "NOTES",
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
                    return buildSubjectItem(
                      '${itemList[index].subjectname}',
                    );
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
                          builder: (context) => NewSub(Sub('')),
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
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.10,
                width: size.width * 0.94,
                child: Card(
                  color: Colors.lightBlueAccent[100],
                  elevation: 10,
                  shadowColor: Colors.blueGrey[100],
                  margin: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(children: <Widget>[
                      Positioned(
                        top: 5.0,
                        left: 5.0,
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UnitPage(text: subjectName),
                          fullscreenDialog: true));
                      },
                      child: Container(
                        child: Text(subjectName,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold)),

                      ),
                    ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
