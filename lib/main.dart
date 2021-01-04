import 'package:Utopia_1/student/Dates/dates.dart';
import 'package:Utopia_1/teacher/Dashboard/Dates/dates.dart';
import 'package:Utopia_1/teacher/Dashboard/Events/event.dart';
import 'package:Utopia_1/teacher/Dashboard/Notes/notes1.dart';
import 'package:Utopia_1/teacher/Dashboard/Notice/notice2.dart';
import 'package:Utopia_1/teacher/Dashboard/Syllabus/syllabus2.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Contact/aap_info.dart';
import 'Contact/contact_us.dart';
import 'Contact/parul_info.dart';
import 'Contact/priyanka_info.dart';

import 'home.dart';
import 'package:flutter/material.dart';
import 'student/Dates/dates.dart';
import 'choose.dart';
import 'teacher/Dashboard/Semester.dart';
import 'student/Dashboard/subjects.dart';
import 'student/login.dart';
import 'teacher/Dashboard/home2.dart';
import 'teacher/login.dart';
import 'student/Dashboard/home.dart';
import 'teacher/Dashboard/Notice/notice2.dart';
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
        '\teachersem': (BuildContext context) => new SemesterTeacher(),
        '\teachernotes': (BuildContext context) => new NotesTeacher(),
        '\subjects': (BuildContext context) => new Subjects(),
        '\home': (BuildContext context) => new HomePage(),
        '\contact': (BuildContext context) => new Contact(),
        '\teachernotice': (BuildContext context) => new NoticeTeacher(),
        '\teacherevent': (BuildContext context) => new EventTeacher(),
        '\teachersyllabus': (BuildContext context) => new SyllabusTeacher(),
        '\parulinfo': (BuildContext context) => new ParulInfo(),
        '\priyankainfo': (BuildContext context) => new PriyankaInfo(),
        '\appinfo': (BuildContext context) => new AppInfo(),
        '\teacherdate': (BuildContext context) => new DatesTeacher(),
        '\studentdate': (BuildContext context) => new DatesStudent(),

        
      },
    );
  }
}
