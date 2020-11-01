
import 'package:Utopia_1/teacher/Dashboard/Syllabus/FireStore.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FireStore.dart';
import 'sub.dart';

class NewSubject extends StatefulWidget {
  
final Subject subject;
NewSubject(this.subject);
  @override
  _NewSubjectState createState() => _NewSubjectState();
}

class _NewSubjectState extends State<NewSubject> {
  FirestoreService fireServ = new FirestoreService();

  TextEditingController _subjectNameController;

  @override
  void initState() {
    super.initState();

    _subjectNameController = new TextEditingController(text: widget.subject.subjectname);
    
  }
  
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

   Size size = MediaQuery.of(context).size;
    return new Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Container(
        
        height: size.height,
        width: double.infinity,
        child: Center(
            child: Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ADD NEW SUBJECT',
                      style: GoogleFonts.pollerOne(
                          color: Colors.blue[900], fontSize: 20.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _subjectNameController,
                      decoration: InputDecoration(hintText: 'Subject Name'),
                      validator: (String value){
                        if (value.isEmpty) {
                          return "Please Enter Some Text";
                        }
                        return null;
                      },
                      
                    ),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: Text(
                          'Upload PDF',
                          style: GoogleFonts.acme(
                              color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        if(_formKey.currentState.validate()){
                          fireServ.createSubjectList(_subjectNameController.text, ).then((_) {
                           Navigator.pop(context);
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: Text(
                          'SUBMIT',
                          style: GoogleFonts.acme(
                              color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    )));
  }
  
}