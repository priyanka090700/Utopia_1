
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:Utopia_1/globals.dart';
import 'package:Utopia_1/teacher/Dashboard/Attendance/sub.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class NewSubject extends StatefulWidget {
final String text; 
final Subject subject;
NewSubject(this.subject, this.text);
  @override
  _NewSubjectState createState() => _NewSubjectState();
}

class _NewSubjectState extends State<NewSubject> {
  
  String db;
  
 
  TextEditingController _subjectNameController;

  @override
  void initState() {
    super.initState();
    if(Globals.sem == 5){
      if(Globals.branch =='cse'){
        db='Sem5CseAttendance';
      }
    }
 if(Globals.sem == 6){
   if(Globals.branch =='cse'){
      db='Sem6CseAttendance';}
 }
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
                      'ADD NEW MONTH',
                      style: GoogleFonts.pollerOne(
                          color: Colors.blue[900], fontSize: 20.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _subjectNameController,
                      decoration: InputDecoration(hintText: 'Month'),
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
                        getPdfAndUpload();
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
                          
                           Navigator.pop(context);
                         
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
 Future getPdfAndUpload() async {
    File file;
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['pdf','jpg','doc']);
    String fileName = _subjectNameController.text;
    if(result != null) {
    
     file = File(result.files.first.path);
   }
    savePdf(file.readAsBytesSync(), '${fileName}Attendance.pdf');
  }

  savePdf(List<int> asset, String name) async {
    StorageReference reference = FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = reference.putData(asset);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    documentFileUpload(url,name);
  }

  
  String createCryptoRandomString([int length = 32]) {
    final Random _random = Random.secure();
    final values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  void documentFileUpload(String str,String name) {
    final mainReference = FirebaseDatabase.instance.reference().child(db).child(widget.text);
    var data = {"PDF": str, "FileName": _subjectNameController.text};
    mainReference.child(createCryptoRandomString()).set(data).then((v) {
      print("Store Successfully");
    });
  } 
}