import 'package:flutter/material.dart';
class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);
static const String id='info_page';
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'text'
              ),
            )
          ],
        ),
      ),
    );
  }
}
