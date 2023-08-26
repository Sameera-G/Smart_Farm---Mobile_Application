import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:smartfarm/screens/pump.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _GetStartState();
}

class _GetStartState extends State<DashPage> {
  DatabaseReference reference = FirebaseDatabase.instance.ref('Sensor');
  DatabaseReference statusvars = FirebaseDatabase.instance.ref('StatusVars');
  DatabaseReference statusvars2 = FirebaseDatabase.instance.ref();

  bool status = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient's Dashboard"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/drone1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Patient's medical information",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            StreamBuilder(
              stream: reference.onValue,
              builder: ((context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list.clear();
                  list = map.values.toList();
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: height * 0.2,
                    width: width,
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Temperature",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "${list.elementAt(0).toString()} Celcius",
                            style: const TextStyle(fontSize: 25.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
            ),
            const SizedBox(
              height: 5.0,
            ),
            StreamBuilder(
              stream: reference.onValue,
              builder: ((context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list.clear();
                  list = map.values.toList();
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: height * 0.2,
                    width: width,
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Humidity in the Room",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "${list.elementAt(1).toString()} %",
                            style: const TextStyle(fontSize: 25.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
            ),
            const SizedBox(
              height: 2,
            ),
            StreamBuilder(
              stream: statusvars.onValue,
              builder: ((context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  Map<dynamic, dynamic> mapstatus =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> statuslist = [];
                  statuslist.clear();
                  statuslist = mapstatus.values.toList();
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: height * 0.2,
                    width: width,
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Oxygen Level",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "${statuslist.elementAt(1).toString()} %",
                            style: const TextStyle(fontSize: 25.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
            ),
            MaterialButton(
              onPressed: () {
                Map<String, int> students = {
                  'pump_status': 1,
                };
                statusvars2.child('StatusVars').update(students).then((value) =>
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Pump())));
              },
              color: Colors.blue,
              textColor: Color.fromARGB(255, 29, 13, 13),
              minWidth: 300,
              height: 40,
              child: const Text('Alert the Emergency Unit'),
            ),
          ],
        ),
      ),
    );
  }

  /* InsertD() {
    SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              /* TextField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Time',
                  hintText: 'Enter Time',
                ),
              ), */
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> students = {'pump_status': 'true'};
                  dbRef
                      .child('StatusVars')
                      .update(students)
                      .then((value) => {Navigator.pop(context)});
                },
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
                child: const Text('Insert Data'),
              ),
            ],
          ),
        ),
      ),
    );
  } */
}
