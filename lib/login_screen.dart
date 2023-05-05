import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled976/home_screen.dart';
import 'package:untitled976/student_screen.dart';
import 'package:untitled976/teacher_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
var roles=['student','teacher','admin'];
class _LoginScreenState extends State<LoginScreen> {

 var selected=roles[0];
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(
                hintText: 'age',
              ),
            ),
            SizedBox(
              height: 20,
            ),

            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            DropdownButton(
                value:selected,
                items: roles.map((e) => DropdownMenuItem(value:e, child: Text(e))).toList(), onChanged: (a){
                  setState(() {
                    selected=a!;

                  });
            }),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('Email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                sp.setString('userType', selected);
                sp.setBool('isLogin', true);

                if (sp.getString('userType') == 'student') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                } else if (sp.getString('userType') == 'teacher') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeacherScreen()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: const Center(
                  child: Text('Sign up'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
