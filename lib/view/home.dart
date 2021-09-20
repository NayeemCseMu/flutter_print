import 'package:flutter/material.dart';
import 'package:flutter_print/view/print_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Print"),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          TextField(
            controller: _controller,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.to(() => PrintDoc(_controller.text));
            },
            child: Text("Print"),
          )
        ],
      ),
    );
  }
}
