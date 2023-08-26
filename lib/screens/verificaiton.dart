import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.dstATop),
          ),
        ),
        child: const Card(
          child: Text("Login Invalid, please try again later"),
        ),
      ),
    );
  }
}
