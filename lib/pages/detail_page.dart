import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firepostclone/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
static const String id='detail_page';
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  // final CollectionReference productss =
  // FirebaseFirestore.instance.collection('Products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Add Post'),

      ),
      body: SingleChildScrollView(
        child: Container(
          margin:const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller:nameController ,
                decoration:const InputDecoration(
                  hintText: 'Name'
                ),
              ),
           const   SizedBox(height: 20,),
              TextField(
                controller:emailController ,
                decoration:const InputDecoration(
                    hintText: 'Email'
                ),
              ),
              const   SizedBox(height: 20,),
              TextField(
                controller:passwordController ,
                decoration:const InputDecoration(
                    hintText: 'Password'
                ),
              ),
              const SizedBox(height: 50,),
              Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10),
                child: ElevatedButton(
                  child: const Text('Add Post Button'),
                  onPressed: (){
                    Post post=Post(name: nameController.text, email: emailController.text, password: passwordController.text, id: '');
                     createPost(post);
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage(addPost: true)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
Future createPost(Post post)async{
    final docPost=FirebaseFirestore.instance.collection('product');
    post.id=docPost.id;
    final json=post.toJson();
    docPost.add(json);
}


}
