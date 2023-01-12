import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mobilenumbersearch extends StatefulWidget {
  @override
  _mobilenumbersearchState createState() => _mobilenumbersearchState();
}

class _mobilenumbersearchState extends State<mobilenumbersearch> {
  var mobilenumbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    {

      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Container(
                width: 400,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(width: 8, color: Colors.green),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: mobilenumbercontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Phone Number",
                        ),




                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: ElevatedButton(
                onPressed: () {
                  print(mobilenumbercontroller.text.toString());


                },
                child: Text('Search'),
              ),
            )
          ],
        ),
      );
    }
  }
}
