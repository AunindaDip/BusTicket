import 'dart:convert';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:busticketreservation/ModelClasses/Businfomodel.dart';
import 'package:busticketreservation/seat_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class Searchedbus extends StatefulWidget {
  final String leaving, destination, date;

  const Searchedbus(
      {Key? key,
      required this.leaving,
      required this.destination,
      required this.date})
      : super(key: key);
  @override
  _SearchedbusState createState() =>
      _SearchedbusState(leaving, destination, date);
}

class _SearchedbusState extends State<Searchedbus> {
  _SearchedbusState(
    leaving,
    destination,
    date,
  );
  final selectseat selectseatcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "BTRS",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchbusinfo(widget.leaving, widget.destination, widget.date),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              print(widget.leaving.toString().toLowerCase() +
                  widget.destination.toString() +
                  widget.date.toString() +
                  "Doo");
              return Center(
                  child: Container(
                child: Text("dip"),
              ));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int Index) {
                    print(widget.leaving.toString().toLowerCase() +
                        widget.destination.toString() +
                        widget.date.toString() +
                        "Dip");

                    print(snapshot.hasData.toString());
                    return Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(5.0, 5.0), //(x,y)
                                  blurRadius: 8.0,
                                ),
                              ],
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 2),
                                    child: Text(
                                      snapshot.data[Index].name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 2),
                                    child: Text(
                                      snapshot.data[Index].fare,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 2),
                                    child: Text("Available Seates"),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 2),
                                    child:
                                        Text(snapshot.data[Index].seatcapacity),
                                  )
                                ],
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Center(
                                        child: TextButton(
                                        onPressed: () {



                                          selectseatcontroller.selectedseats.refresh();

                                          Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => seat_view(
                                                      id: snapshot
                                                          .data[Index].id
                                                          .toString(),
                                                    )));




                                        /*print(
                                            snapshot.data[Index].id.toString());*/
                                      },
                                      child: Text("View Seats"),
                                    ))
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ))
                      ],
                    );
                  });
            } else {
              return Center(
                  child: Container(
                child: Text("saha"),
              ));
            }
          },
        ),
      ),
    );
  }
}

Future<List<businfomodel>> fetchbusinfo(String a, b, c) async {
  var url = Uri.parse("https://btrs.ticket.symbexit.com/api/getbusinfos");
  var data = await http.get(url);
  var jsonData = json.decode(data.body);
  print(jsonData);
  final list = jsonData as List<dynamic>;
  return list
      .map((e) => businfomodel.fromJson(e))
      .where((element) =>
          element.leavingFrom
              .toString()
              .toLowerCase()
              .contains(a.toString().toLowerCase()) &&
          element.goingTo
              .toString()
              .toLowerCase()
              .contains(b.toString().toLowerCase()) &&
          element.day
              .toString()
              .toLowerCase()
              .contains(c.toString().toLowerCase()))
      .toList();
}
