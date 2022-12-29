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
  final String leaving, destination, date,TripDaTe;

  const Searchedbus(
      {Key? key,
      required this.leaving,
      required this.destination,
      required this.date,
        required this.TripDaTe})
      : super(key: key);
  @override
  _SearchedbusState createState() =>
      _SearchedbusState(leaving, destination, date,TripDaTe);
}

class _SearchedbusState extends State<Searchedbus> {
  _SearchedbusState(
    leaving,
    destination,
    date,
      forticket
  );
  final selectseat selectseatcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "BTRS",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchbusinfo(widget.leaving, widget.destination, widget.date),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              print(
                  "${widget.leaving.toString().toLowerCase()}${widget.destination}${widget.date}Doo");
              return Center(
                  child: Container(
                child: Text("dip"),
              ));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int Index) {
                    print("${widget.leaving.toString().toLowerCase()}"
                        "${widget.destination}${widget.date}Dip");

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
                              Center(
                                child:
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 2),
                                    child: Text(
                                      snapshot.data[Index].name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),



                              ),
                              Row(
                                children: [
                                   Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2),
                                    child: Text(
                                      "Ticket Price : " + snapshot.data[Index].fare+ " Tk.",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 2),
                                    child: Text(
                                      "Available Seats : " +
                                      snapshot.data[Index].seatcapacity,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 2),
                                    child: Text(
                                      "Departure Day : " +
                                          snapshot.data[Index].day,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                   Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 2),
                                    child: Text(
                                      "Departure Time : " +
                                          snapshot.data[Index].departureTime,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Center(
                                        child: TextButton(
                                      onPressed: () {
                                        selectseatcontroller.selectedseats =
                                            [].obs;
                                        selectseatcontroller.totalcoast =
                                            0.0.obs;

                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => seat_view(
                                                      id: snapshot
                                                          .data[Index].id
                                                          .toString(),
                                                  fare: snapshot
                                                      .data[Index].fare,
                                                  Busleavingday: snapshot
                                                          .data[Index].day.toString(),

                                                  departure:widget.leaving,
                                                  destination:widget.destination,
                                                  BusName:snapshot
                                                      .data[Index].name,
                                                  deaprtureTime:snapshot
                                                      .data[Index].departureTime,
                                                    TripDaTe:widget.TripDaTe.toString(),


                                                    )));

                                        print(snapshot.data[Index].day
                                            .toString());
                                      },
                                      child: const Text("View Seats"),
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
                ),
              );
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
