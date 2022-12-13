import 'dart:convert';
import 'dart:io';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:busticketreservation/ModelClasses/Bus_Seat_Info.dart';
import 'package:busticketreservation/ModelClasses/sear_reserveatiomodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';

class seat_view extends StatelessWidget {
  final String id;
  seat_view({Key? key, required this.id}) : super(key: key);
  int alphabetCounter = -1;
  int a = 0;
  var d;

  var dip = seatreserve;
  final selectseat selectseatcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            selectseatcontroller.selectedseats.clear();
            Get.back();
          },
        ),
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
                    padding: const EdgeInsets.fromLTRB(120, 8, 0, 0),
                    child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            //border: Border.all(color: Colors.grey, width: 10),
                            image: DecorationImage(
                          image: AssetImage("lib/assets/images/Driverseat.jpg"),
                        ))),
                  ),
                  Container(
                    height: 20,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Row(
                            children: [
                              ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                      Colors.green, BlendMode.darken),
                                  child: Image.asset(
                                      "lib/assets/images/seat.png")),
                              Text("Reserved"),
                              ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                      Colors.yellow, BlendMode.darken),
                                  child: Image.asset(
                                      "lib/assets/images/seat.png")),
                              Text("Confirmed"),
                              ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
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
                    decoration: const BoxDecoration(
                        //border: Border.all(color: Colors.grey, width: 10),

                        ),
                    child: FutureBuilder(
                      future: Buildseatinfo(id),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        print(id.toString());

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

                                              selectseatcontroller.booketseats
                                                  .assign(snapshot
                                                      .data[Index].seat_name);

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
                                                              if (snapshot
                                                                  .data[Index]
                                                                  .seat_name
                                                                  .toString()
                                                                  .contains(
                                                                      Rownum +
                                                                          d)) {
                                                                Scaffold.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        SnackBar(
                                                                  content: Text(
                                                                      "This seat is Not Avilable"),
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                ));
                                                              } else {
                                                                if (selectseatcontroller
                                                                        .selectedseats
                                                                        .contains(
                                                                            Rownum +
                                                                                d) ||
                                                                    snapshot
                                                                        .data[
                                                                            Index]
                                                                        .seat_name
                                                                        .toString()
                                                                        .contains(Rownum +
                                                                            d) ||
                                                                    (selectseatcontroller
                                                                            .selectedseats
                                                                            .length >=
                                                                        4)) {
                                                                  if ((selectseatcontroller
                                                                          .selectedseats
                                                                          .length >=
                                                                      4)) {
                                                                    Scaffold.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                            SnackBar(
                                                                      content: Text(
                                                                          "You cant Reserve more than 4 seats"),
                                                                      duration: Duration(
                                                                          seconds:
                                                                              2),
                                                                    ));
                                                                  }

                                                                  selectseatcontroller
                                                                      .selectedseats
                                                                      .remove(
                                                                          Rownum +
                                                                              d);
                                                                } else {
                                                                  selectseatcontroller
                                                                      .selectedseats
                                                                      .add(Rownum +
                                                                          d);
                                                                  addtopost(id);
                                                                }
                                                              }
                                                            },
                                                            child: Obx(
                                                              () => Container(
                                                                  height: 35,
                                                                  width: 35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: selectseatcontroller
                                                                            .booketseats
                                                                            .toString()
                                                                            .contains(Rownum +
                                                                                d)
                                                                        ? Colors
                                                                            .grey
                                                                        : selectseatcontroller.selectedseats.contains(Rownum +
                                                                                d)
                                                                            ? Colors.blueAccent
                                                                            : Colors.white,
                                                                    image:
                                                                        const DecorationImage(
                                                                      image: AssetImage(
                                                                          "lib/assets/images/seat.png"),
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),

                                                                    //borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Padding(
                                                                          padding: const EdgeInsets.all(
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            Rownum +
                                                                                d,
                                                                            style:
                                                                                const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                                          )),
                                                                    ],
                                                                  )),
                                                            )));
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
            child:
                Obx(() => Text(selectseatcontroller.selectedseats.toString())),
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
    } else {
      deviceId = 'null';
    }
    seatreserve Seatreserve = seatreserve(
        BusinfoID: id,
        setquantity: selectseatcontroller.selectedseats.length.toString(),
        devicetoken: deviceId,
        selectseat: selectseatcontroller.selectedseats);

    print(Seatreserve.toJson());
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

addcolor(Colors) {
  return Colors;
}
