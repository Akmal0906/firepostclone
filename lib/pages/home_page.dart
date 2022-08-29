import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firepostclone/pages/detail_page.dart';
import 'package:firepostclone/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class HomePage extends StatefulWidget {
    bool addPost;

  HomePage({this.addPost = false});

  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // final CollectionReference postes =
  // FirebaseFirestore.instance.collection('production');

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getPostInfo();
  }

  @override
  void activate() {
    // TODO: implement activate
    super.activate();
    getPostInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('All Of the Post'),
        actions: [
          IconButton(
              onPressed: () {
                AuthService.signOutUser(context);
                Navigator.pop(context);
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInPage()));
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body:  ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if( widget.addPost==true && index!=0){

              widget.addPost=false;
              index=0;
            }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                  Text('User Name ${items[index].name}'),
                  const SizedBox(height: 5,),
                  Text('email  ${items[index].email}'),


              const SizedBox(height: 5,),
              Text('password  ${items[index].password}'),
            const SizedBox(height: 30,),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, DetailPage.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future getPostInfo() async {
 //   final uui = AuthService.auth.currentUser?.uid;
    var data = await FirebaseFirestore.instance.collection('product').get();
    setState(() {
      items = List.from(data.docs.map((doc) => Post.fromJson(doc.data())));
    });
  }
}
