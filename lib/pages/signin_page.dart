// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firepostclone/pages/home_page.dart';
import 'package:firepostclone/pages/signup_page.dart';
import 'package:firepostclone/services/auth_service.dart';
import 'package:firepostclone/services/prefs_service.dart';
import 'package:firepostclone/services/utilis_service.dart';
import 'package:flutter/material.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);
  static const String id='signin_page';
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  void doSignIn(){
    final email=emailController.text.toString().trim();
    final password=passwordController.text.toString().trim();
    if(email==null && password==null){
      return;
    }
AuthService.signInUser(context, password, email).then((user) =>{
  getFirebaseUser(user),
});
  }
  getFirebaseUser(User user)async{
    if(user!=null){
       Prefs().storeId(user.uid);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
    }else{
      Utilis.fireToast('Please check email or password');
    }
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration:const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email)
                  ),

                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: passwordController,
                  decoration:const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock)
                  ),

                ),
                const  SizedBox(height: 40,),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 10,right: 10),
                  child: ElevatedButton(
                    child: const Text('SignIn Page'),
                    onPressed: ()=>doSignIn(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                        const  Text('Already have account ?'),
                        const  SizedBox(width: 20,),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context,SignUpPage.id);
                          }, child:const Text('Sign Up'))
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
