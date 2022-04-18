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
      body: Center(
        child: Text("Fast name is: ${widget.fastname}\nLast name is: ${widget.lastname}\nName is: ${widget.fastname} "+" ${widget.lastname}"),
      ),
    );
  }
}
