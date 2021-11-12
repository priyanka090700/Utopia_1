
import 'package:Utopia_1/student/Dashboard/Attendance/attendance.dart';
import 'package:Utopia_1/student/Dashboard/Dates/dates.dart';
import 'package:Utopia_1/student/Dashboard/Ebook/ebook.dart';
import 'package:Utopia_1/student/Dashboard/Events/event.dart';
import 'package:Utopia_1/student/Dashboard/Notes/notes.dart';
import 'package:Utopia_1/student/Dashboard/Notice/notice.dart';
import 'package:Utopia_1/student/Dashboard/PracticePaper/paper.dart';
import 'package:Utopia_1/student/Dashboard/Semester1.dart';
import 'package:Utopia_1/student/Dashboard/Syllabus/syllabus.dart';
import 'package:Utopia_1/student/Dashboard/TimeTable/tt.dart';
import 'package:Utopia_1/student/Dashboard/home1.dart';
import 'package:Utopia_1/teacher/Dashboard/Attendance/attendance.dart';
import 'package:Utopia_1/teacher/Dashboard/Dates/dates.dart';
import 'package:Utopia_1/teacher/Dashboard/Ebook/ebook.dart';
import 'package:Utopia_1/teacher/Dashboard/Events/event.dart';
import 'package:Utopia_1/teacher/Dashboard/Notes/notes1.dart';
import 'package:Utopia_1/teacher/Dashboard/Notice/notice2.dart';
import 'package:Utopia_1/teacher/Dashboard/PracticePaper/pp.dart';
import 'package:Utopia_1/teacher/Dashboard/Syllabus/syllabus2.dart';
import 'package:Utopia_1/teacher/Dashboard/TimeTable/timetable.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Contact/aap_info.dart';
import 'Contact/contact_us.dart';
import 'Contact/parul_info.dart';
import 'Contact/priyanka_info.dart';

import 'home.dart';
import 'package:flutter/material.dart';

import 'choose.dart';
import 'teacher/Dashboard/Semester.dart';

import 'student/login.dart';
import 'teacher/Dashboard/home2.dart';
import 'teacher/login.dart';

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
        '\teacherdash': (BuildContext context) => new TeacherDashboard(),
        '\studash': (BuildContext context) => new StudentDashboard(),
        '\teachersem': (BuildContext context) => new SemesterTeacher(),
        '\teachernotes': (BuildContext context) => new NotesTeacher(),
        '\home': (BuildContext context) => new HomePage(),
        '\contact': (BuildContext context) => new Contact(),
        '\teachernotice': (BuildContext context) => new NoticeTeacher(),
        '\teacherevent': (BuildContext context) => new EventTeacher(),
        '\teachertt': (BuildContext context) => new TimeTableTeacher(),
        '\teacherpp': (BuildContext context) => new PracticePaperTeacher(),
        '\teacherebook': (BuildContext context) => new EbookTeacher(),
        '\teachersyllabus': (BuildContext context) => new SyllabusTeacher(),
        '\parulinfo': (BuildContext context) => new ParulInfo(),
        '\priyankainfo': (BuildContext context) => new PriyankaInfo(),
        '\appinfo': (BuildContext context) => new AppInfo(),
        '\teacherdate': (BuildContext context) => new DatesTeacher(),
        '\teacherattendance': (BuildContext context) => new AttendanceTeacher(),
        '\studentattendance': (BuildContext context) => new AttendanceStudent(),
        '\studentdate': (BuildContext context) => new DatesStudent(),
        '\studentebook': (BuildContext context) => new EbookStudent(),
        '\studentevent': (BuildContext context) => new EventStudent(),
        '\studentnotice': (BuildContext context) => new NoticeStudent(),
        '\studentsyllabus': (BuildContext context) => new SyllabusStudent(),
        '\studentnotes': (BuildContext context) => new NotesStudent(),
        '\studentpp': (BuildContext context) => new PracticePaperStudent(),

        '\studenttt': (BuildContext context) => new TimeTableStudent(),
        '\studentsem': (BuildContext context) => new SemesterStudent(),
      },
    );
  }
}
