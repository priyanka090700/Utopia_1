import 'package:Utopia_1/globals.dart';
import 'package:Utopia_1/teacher/Dashboard/PracticePaper/sub.dart';
import 'package:Utopia_1/teacher/Dashboard/PracticePaper/subject.dart';
import 'package:Utopia_1/teacher/Dashboard/PracticePaper/viewPDF.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YearPage extends StatefulWidget {
  final String text;
  const YearPage({Key key, @required this.text}) : super(key: key);

  @override
  _YearPageState createState() => _YearPageState();
}
class _YearPageState extends State<YearPage> {
 List<Subject> itemList = List();
 String db; 
  @override
  void initState() {
    super.initState();
    if(Globals.sem == 5){
      if(Globals.branch =='cse'){
        db='Sem5CsePapers';
      }
    }
 if(Globals.sem == 6){
   if(Globals.branch =='cse'){
      db='Sem6CsePapers';}
 }
 final mainReference = FirebaseDatabase.instance.reference().child(db).child(widget.text);
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
      color: Colors.white,
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.05),
          Text(
            widget.text,
            textAlign: TextAlign.start,
            style: GoogleFonts.pollerOne(color: Colors.blue[900], fontSize: 25.0),
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
                    String subname = widget.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewSubject(Subject('',""),subname),
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
                  color: Colors.blueGrey[100],
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
                                    color: Colors.black,
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