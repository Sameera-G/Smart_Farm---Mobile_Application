import 'package:flutter/material.dart';
import 'package:smartfarm/screens/dashpage.dart';
import 'package:smartfarm/screens/fetch_data.dart';
import 'package:smartfarm/screens/fetch_humi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Monitor the Patient'),
        ),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/smart1.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black87, BlendMode.dstATop),
            ),
          ),
          child: Card(
            margin: EdgeInsets.all(15.0),
            color: Colors.transparent,
            shadowColor: Colors.black,
            elevation: 5.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /*Image.asset(
                  'images/drone1.jpg',
                  width: 300,
                  height: 300,
                ),*/
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.2,
                  width: width * 0.8,
                  child: const Text(
                    'Tempratature, Humidity & Oxygen Level of the Patient',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashPage()));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  minWidth: 300,
                  height: 50,
                  child: const Text('Dash Board'),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FetchData()));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  minWidth: 300,
                  height: 50,
                  child: const Text('Temperature'),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        //add the new page humidity
                        MaterialPageRoute(
                            builder: (context) => const FetchDataHumi()));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  minWidth: 300,
                  height: 50,
                  child: const Text('Humidity'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
