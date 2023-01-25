import 'package:flutter/material.dart';


class myprofildrwaer extends StatefulWidget {
  const myprofildrwaer({Key? key}) : super(key: key);

  @override
  _myprofildrwaerState createState() => _myprofildrwaerState();
}

class _myprofildrwaerState extends State<myprofildrwaer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(5.0, 5.0), //(x,y)
              blurRadius: 8.0,
            ),
          ],
          image: const DecorationImage(
            image: AssetImage("lib/assets/images/bus1.jpg"),
          )),
      width: double.infinity,
      height: 290,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 70,
            ),
          ),
          const Text(
            "Bus Ticket System",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
