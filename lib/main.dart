import 'package:Utopia_1/teacher/Dashboard/Dates/dates.dart';
import 'package:Utopia_1/teacher/Dashboard/notice2.dart';
import 'package:Utopia_1/teacher/Dashboard/Syllabus/syllabus2.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Contact/aap_info.dart';
import 'Contact/contact_us.dart';
import 'Contact/parul_info.dart';
import 'Contact/priyanka_info.dart';

import 'home.dart';
import 'package:flutter/material.dart';

import 'choose.dart';
import 'student/Dashboard/Notes.dart';
import 'student/Dashboard/subjects.dart';
import 'student/login.dart';
import 'teacher/Dashboard/home2.dart';
import 'teacher/login.dart';
import 'student/Dashboard/home.dart';
import 'teacher/Dashboard/notice2.dart';
import 'teacher/Dashboard/Syllabus/syllabus2.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Utopia',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '\stulogin': (BuildContext context) => new LoginStudent(),
        '\teacherlogin': (BuildContext context) => new LoginTeacher(),
        '\choose': (BuildContext context) => new Choose(),
        '\studash': (BuildContext context) => new Dashboard(),
        '\teacherdash': (BuildContext context) => new TeacherDashboard(),
        '\notes': (BuildContext context) => new Notes(),
        '\subjects': (BuildContext context) => new Subjects(),
        '\home': (BuildContext context) => new HomePage(),
        '\contact': (BuildContext context) => new Contact(),
        '\teachernotice': (BuildContext context) => new TeacherNotice(),
        '\teachersyllabus': (BuildContext context) => new SyllabusTeacher(),
        '\parulinfo': (BuildContext context) => new ParulInfo(),
        '\priyankainfo': (BuildContext context) => new PriyankaInfo(),
        '\appinfo': (BuildContext context) => new AppInfo(),
        '\teacherdate': (BuildContext context) => new DatesTeacher(),

        
      },
    );
  }
}
