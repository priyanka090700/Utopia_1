import 'package:Utopia_1/globals.dart';
import 'package:Utopia_1/teacher/Dashboard/PracticePaper/sub.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewSub extends StatefulWidget {
  
final Sub sub;
NewSub(this.sub);
  @override
  _NewSubState createState() => _NewSubState();
}

class _NewSubState extends State<NewSub> {
  
  String db;
  
 
  TextEditingController _subjectNameController;

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
    _subjectNameController = new TextEditingController(text: widget.sub.name);
    
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
                        if(_formKey.currentState.validate()){
                          uploadSubject();
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
 Future uploadSubject() async {
    String fileName = _subjectNameController.text;
    savesub( fileName);
  }

  savesub( String name) async {
   final mainReference = FirebaseDatabase.instance.reference().child(db);
    var data = {"FileName": _subjectNameController.text};
    mainReference.child(name).set(data).then((v) {
      print("Store Successfully");
    }); 
  }

}