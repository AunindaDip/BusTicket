import 'dart:convert';
import 'dart:io';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:busticketreservation/ModelClasses/Bus_Seat_Info.dart';
import 'package:busticketreservation/ModelClasses/sear_reserveatiomodel.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:device_info_plus/device_info_plus.dart';

class seat_view extends StatefulWidget {
  final String id;
  const seat_view({Key? key, required this.id}) : super(key: key);
  @override
  _seat_viewState createState() => _seat_viewState(id);
}

class _seat_viewState extends State<seat_view> {
  bool isActive = true;
  int? selectedIndex;

  _seat_viewState(id);
  int alphabetCounter = -1;

  int a = 0;
  var d;
  List<String> Selectedseats = [];
  final controller = Get.put((selectseat));

  var dip = seatreserve;

  @override
  void setState(VoidCallback fn) {
    a = 0;

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 10,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(120, 8, 0, 0),
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.grey, width: 10),

                            image: new DecorationImage(
                          image: new AssetImage(
                              "lib/assets/images/Driverseat.jpg"),
                        ))),
                  ),
                  Container(
                    height: 20,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Row(
                            children: [
                              ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      Colors.green, BlendMode.darken),
                                  child: Image.asset(
                                      "lib/assets/images/seat.png")),
                              Text("Reserved"),
                              ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      Colors.yellow, BlendMode.darken),
                                  child: Image.asset(
                                      "lib/assets/images/seat.png")),
                              Text("Confirmed"),
                              ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      Colors.white, BlendMode.darken),
                                  child: Image.asset(
                                      "lib/assets/images/seat.png")),
                              Text("Available"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 450,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey, width: 10),

                        ),
                    child: FutureBuilder(
                      future: Buildseatinfo(widget.id),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        print(widget.id.toString());

                        if (snapshot.data == null) {
                          return Center(
                              child: Container(
                            child: Text("dip"),
                          ));
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int Index) {
                                return Container(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ...List.generate(
                                                int.parse(snapshot
                                                    .data[Index].row
                                                    .toString()), (column) {
                                              alphabetCounter++;

                                              String Rownum =
                                                  (String.fromCharCode(
                                                          65 + alphabetCounter)
                                                      .toString());

                                              return Wrap(
                                                children: [
                                                  ...List.generate(
                                                      int.parse(snapshot
                                                              .data[Index]
                                                              .coloumn
                                                              .toString()) +
                                                          1, (row) {
                                                    a = row;
                                                    a++;

                                                    if (int.parse(snapshot
                                                                .data[Index]
                                                                .coloumn) ==
                                                            4 &&
                                                        row == 2) {
                                                      return (Container(
                                                        height: 10,
                                                        width: 10,
                                                      ));
                                                    }

                                                    if (int.parse(snapshot
                                                                .data[Index]
                                                                .coloumn) ==
                                                            3 &&
                                                        row == 1) {
                                                      return (Container(
                                                        height: 10,
                                                        width: 10,
                                                      ));
                                                    }
                                                    if (int.parse(snapshot
                                                                .data[Index]
                                                                .coloumn) ==
                                                            3 &&
                                                        row == 2) {
                                                      --a;
                                                    }

                                                    if (int.parse(snapshot
                                                                .data[Index]
                                                                .coloumn) ==
                                                            3 &&
                                                        row == 3) {
                                                      --a;
                                                    }

                                                    if (int.parse(snapshot
                                                                .data[Index]
                                                                .coloumn) ==
                                                            4 &&
                                                        row == 3) {
                                                      --a;
                                                    }
                                                    if (int.parse(snapshot
                                                                .data[Index]
                                                                .coloumn) ==
                                                            4 &&
                                                        row == 4) {
                                                      --a;
                                                    }
                                                    String d = a.toString();

                                                    return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: InkWell(
                                                          onTap: () {



                                                            if (!(Rownum+d).contains(snapshot.data[Index].seat_name)){
                                                              Selectedseats.add( Rownum+d);

                                                              print(Selectedseats);

                                                            }







/*


                                                             if(Selectedseats.contains(snapshot
                                                                 .data[Index]
                                                                 .seat_name.toString()))
                                                             {
                                                               Selectedseats.remove(snapshot
                                                                   .data[Index]
                                                                   .seat_name.toString());
                                                              print(Selectedseats);
                                                             }

*/








                                                            }
                                                          ,
                                                          child: Container(
                                                              height: 35,
                                                              width: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: snapshot
                                                                        .data[
                                                                            Index]
                                                                        .seat_name
                                                                        .toString()
                                                                        .contains(String.fromCharCode(65 + alphabetCounter).toString() +
                                                                            (a)
                                                                                .toString())
                                                                    ? Colors
                                                                        .blueGrey
                                                                    : Colors
                                                                        .greenAccent,

                                                                image:
                                                                    new DecorationImage(
                                                                  image: new AssetImage(
                                                                      "lib/assets/images/seat.png"),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),

                                                                //borderRadius: BorderRadius.circular(10),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        " " +
                                                                            String.fromCharCode(65 +
                                                                                alphabetCounter) +
                                                                            (a).toString(),
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      )),
                                                                ],
                                                              )),
                                                        ));
                                                  })
                                                ],
                                              );
                                            })
                                          ]),
                                    ));
                              });
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Text("Dip"),
          )
        ],
      ),
    );
  }

  Future<void> addtopost(String id) async {
    var deviceInfo = DeviceInfoPlugin();
    late String deviceId;

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor!;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id!;
      print(deviceId + "ASD");
    } else {
      deviceId = 'null';
    }

    seatreserve SealectSeat = seatreserve(
        Businfo: id,
        setquantity: Selectedseats.length.toString(),
        devicetoken: deviceId,
        seatnumbers: Selectedseats);
    print(SealectSeat.toJson());
  }
}

Future<List<seatinfo>> Buildseatinfo(String busid) async {
  var url = Uri.parse("http://btrs.ticket.symbexit.com/api/seat_status");
  var data = await http.get(url);
  var jsonData = json.decode(data.body);
  print(jsonEncode(jsonData));
  final list = jsonData as List<dynamic>;
  return list
      .map((e) => seatinfo.fromJson(e))
      .where((element) => element.businfoId
          .toString()
          .toLowerCase()
          .contains(busid.toString().toLowerCase()))
      .toList();
}
