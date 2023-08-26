import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  String realTimeValue = '0';
  String getOnceValue = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Management System"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _fApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something wrong with firebase");
            } else if (snapshot.hasData) {
              return content();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget content() {
    DatabaseReference testRef = FirebaseDatabase.instance
        .ref()
        .child('https://smartfarm-8cc10-default-rtdb.firebaseio.com/counts');
    // listen to firebase  value
    testRef.onValue.listen((event) {
      setState(() {
        realTimeValue = event.snapshot.value.toString();
      });
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Real time counter: $realTimeValue"),
        ),
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () async {
            final snapshot = await testRef.get();
            if (snapshot.exists) {
              setState(() {
                getOnceValue = snapshot.value.toString();
              });
            } else {
              //print("No Data Available");
            }
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text("Get once"),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Text("Get once counter:$getOnceValue"),
        ),
      ],
    );
  }
}
