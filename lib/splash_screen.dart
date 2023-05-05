import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled976/home_screen.dart';
import 'package:untitled976/login_screen.dart';
import 'package:untitled976/student_screen.dart';
import 'package:untitled976/teacher_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  void isLogin() async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool isLogin=sp.getBool('isLogin') ?? false;
    String userType=sp.getString('userType') ?? '';
    if(isLogin){
      if(userType=='student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentScreen())
          );

        });
      }
      else if(userType=='teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TeacherScreen())
          );

        });
      }
      else{
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen())
          );

        });
      }
      }

    else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>LoginScreen())
        );

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Image(
         height: double.infinity,
          fit:BoxFit.fitHeight,
          image:
      NetworkImage('https://images.pexels.com/photos/4939446/pexels-photo-4939446.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load')
      )
    );
  }
}
