// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firepostclone/pages/home_page.dart';
import 'package:firepostclone/pages/signin_page.dart';
import 'package:firepostclone/services/auth_service.dart';
import 'package:firepostclone/services/prefs_service.dart';
import 'package:firepostclone/services/utilis_service.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);
  static const String id = 'signup_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  void doSignUp() {
    final email = emailController.text.toString().trim();
    final password = passwordController.text.toString().trim();
    final name = firstNameController.text.toString().trim();
    final lastName = lastNameController.text.toString().trim();
    if(email==null && password==null&&name==null){
      return;
    }
    AuthService.signUpUser(context, name, email, password).then((user) =>{
      getFirebaseUser(user),
    } );


  }
  getFirebaseUser(User user){
    if(user!=null){
      Prefs().storeId(user.uid);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
    }else{
      Utilis.fireToast('check your email or password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                      hintText: 'First Name', prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                      hintText: 'Last Name', prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: 'Email', prefixIcon: Icon(Icons.email)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    child: const Text('SignUp Page'),
                    onPressed: () => doSignUp(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text('Already have account ?'),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SignInPage.id);
                              },
                              child: const Text('Sign In')),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
