import 'package:flutter/material.dart';
class WelcomePage extends StatefulWidget {

  String? fastname;
  String? lastname;
  WelcomePage(
      {this.fastname,this.lastname}); // const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);

            },
          )
      ),
      body: Center(
        child: Text("Your Name is: ${widget.fastname}\nYour Number is: ${widget.lastname}"),
      ),
    );
  }
}
