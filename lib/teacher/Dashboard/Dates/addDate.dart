
import 'package:Utopia_1/teacher/Dashboard/Dates/FireStore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dat.dart';

class NewDate extends StatefulWidget {
  
final Task task;
  NewDate(this.task);
  @override
  _NewDateState createState() => _NewDateState();
}

class _NewDateState extends State<NewDate> {
  FirestoreService fireServ = new FirestoreService();

  TextEditingController _taskNameController;
  TextEditingController _taskDetailsController;
  TextEditingController _taskDateController;
  TextEditingController _taskTimeController;
  @override
  void initState() {
    super.initState();

    _taskNameController = new TextEditingController(text: widget.task.taskname);
     _taskDetailsController = new TextEditingController(text: widget.task.taskdetails);
     _taskDateController = new TextEditingController(text: widget.task.taskdate);
     _taskTimeController = new TextEditingController(text: widget.task.tasktime);
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
                      'ADD NEW EVENT',
                      style: GoogleFonts.pollerOne(
                          color: Colors.blue[900], fontSize: 20.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _taskNameController,
                      decoration: InputDecoration(hintText: 'Event Name'),
                      validator: (String value){
                        if (value.isEmpty) {
                          return "Please Enter Some Text";
                        }
                        return null;
                      },
                      
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _taskDetailsController,
                      decoration: InputDecoration(hintText: 'Event Detail'),
                       ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _taskDateController,
                      decoration: InputDecoration(hintText: 'Event Date (dd/mm/yyyy)'),
                      validator: (String value){
                        if (value.isEmpty) {
                          return "Please Enter Some Text";
                        }
                        return null;
                      },
                      
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _taskTimeController,
                      decoration: InputDecoration(hintText: 'Event Time (hh:mm) (am/pm)'),
                      
                    ),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        if(_formKey.currentState.validate()){
                          fireServ.createTODOTask(_taskNameController.text, _taskDetailsController.text,_taskDateController.text,_taskTimeController.text).then((_) {
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