import 'package:Utopia_1/student/Dashboard/body1.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: StudentBody(),
    );
  }
}