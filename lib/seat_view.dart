import 'dart:convert';
import 'dart:io';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:busticketreservation/ModelClasses/Bus_Seat_Info.dart';
import 'package:busticketreservation/ModelClasses/sear_reserveatiomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:busticketreservation/Orderonfirmation.dart';

class seat_view extends StatefulWidget {
  final String id,
      fare,
      Busleavingday,
      departure,
      destination,
      BusName,
      deaprtureTime,
      TripDaTe;

  const seat_view(
      {Key? key,
      required this.id,
      required this.fare,
      required this.Busleavingday,
      required this.departure,
      required this.destination,
      required this.BusName,
      required this.deaprtureTime,
      required this.TripDaTe})
      : super(key: key);

  @override
  _seat_viewState createState() => _seat_viewState(id, fare, Busleavingday,
      departure, destination, BusName, deaprtureTime, TripDaTe);
}

class _seat_viewState extends State<seat_view> {
  _seat_viewState(id, fare, Busleavingday, departure, destination, BusName,
      deaprtureTime, TripDaTe);

  int alphabetCounter = -1;
  int numbercounter = 0;
  String? select_bording_Point;
  var dip = seatreserve;
  String _dateTimebuyingTicke = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final selectseat selectseatcontroller = Get.find();
  var Randomid;

  @override
  Widget build(BuildContext context) {
    setState(() {
      const uuid = Uuid();

      Randomid = Uuid().v1();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            selectseatcontroller.selectedseats.clear();
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SingleChildScrollView(
                  child: Container(
                    height: 580,
                    decoration: BoxDecoration(
                      border: Border.all(width: 8, color: Colors.black54),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(5.0, 5.0), //(x,y)
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(120, 8, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      "lib/assets/images/Driverseat.jpg"),
                                ))),
                          ),
                        ),
                        Container(
                          height: 20,
                          // color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                child: Row(
                                  children: [
                                    ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                            Colors.white, BlendMode.darken),
                                        child: Image.asset(
                                            "lib/assets/images/seat.png")),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Text("Available"),
                                    ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                            Colors.grey, BlendMode.darken),
                                        child: Image.asset(
                                            "lib/assets/images/seat.png")),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Text("Soldout"),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                            Colors.lightBlue, BlendMode.darken),
                                        child: Image.asset(
                                            "lib/assets/images/seat.png")),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Text("Selected"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: 450,
                            decoration: const BoxDecoration(
                                //border: Border.all(color: Colors.grey, width: 10),

                                ),
                            child: FutureBuilder(
                              future: Buildseatinfo(widget.id),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder:
                                          (BuildContext context, int Index) {
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
                                                            .toString()),
                                                        (column) {
                                                      alphabetCounter++;
                                                      alphabetCounter = column;

                                                      String Rownum = (String
                                                              .fromCharCode(65 +
                                                                  alphabetCounter)
                                                          .toString());
                                                      selectseatcontroller
                                                          .booketseats
                                                          .assign(snapshot
                                                              .data[Index]
                                                              .seat_name);

                                                      return Wrap(
                                                        children: [
                                                          ...List.generate(
                                                              int.parse(snapshot
                                                                      .data[
                                                                          Index]
                                                                      .coloumn
                                                                      .toString()) +
                                                                  1, (row) {
                                                            numbercounter = row;
                                                            numbercounter++;

                                                            if (int.parse(snapshot
                                                                        .data[
                                                                            Index]
                                                                        .coloumn) ==
                                                                    4 &&
                                                                row == 2) {
                                                              return (Container(
                                                                height: 10,
                                                                width: 10,
                                                              ));
                                                            }

                                                            if (int.parse(snapshot
                                                                        .data[
                                                                            Index]
                                                                        .coloumn) ==
                                                                    3 &&
                                                                row == 1) {
                                                              return (Container(
                                                                height: 10,
                                                                width: 10,
                                                              ));
                                                            }
                                                            if (int.parse(snapshot
                                                                        .data[
                                                                            Index]
                                                                        .coloumn) ==
                                                                    3 &&
                                                                row == 2) {
                                                              --numbercounter;
                                                            }

                                                            if (int.parse(snapshot
                                                                        .data[
                                                                            Index]
                                                                        .coloumn) ==
                                                                    3 &&
                                                                row == 3) {
                                                              --numbercounter;
                                                            }

                                                            if (int.parse(snapshot
                                                                        .data[
                                                                            Index]
                                                                        .coloumn) ==
                                                                    4 &&
                                                                row == 3) {
                                                              --numbercounter;
                                                            }
                                                            if (int.parse(snapshot
                                                                        .data[
                                                                            Index]
                                                                        .coloumn) ==
                                                                    4 &&
                                                                row == 4) {
                                                              --numbercounter;
                                                            }
                                                            String
                                                                viewSeatnumber =
                                                                numbercounter
                                                                    .toString();

                                                            return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        4.0),
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      /*    print(selectseatcontroller
                                                                          .totalcoast)*/

                                                                      if (snapshot
                                                                          .data[
                                                                              Index]
                                                                          .seat_name
                                                                          .toString()
                                                                          .contains(Rownum +
                                                                              viewSeatnumber)) {
                                                                        Scaffold.of(context)
                                                                            .showSnackBar(const SnackBar(
                                                                          content:
                                                                              Text("This seat is Not Available"),
                                                                          duration:
                                                                              Duration(seconds: 1),
                                                                        ));
                                                                      } else {
                                                                        if (selectseatcontroller.selectedseats.contains(Rownum + viewSeatnumber) ||
                                                                            snapshot.data[Index].seat_name.toString().contains(Rownum +
                                                                                viewSeatnumber) ||
                                                                            (selectseatcontroller.selectedseats.length >=
                                                                                4)) {
                                                                          selectseatcontroller
                                                                              .selectedseats
                                                                              .remove(Rownum + viewSeatnumber);
                                                                          selectseatcontroller.totalcoast =
                                                                              double.parse((selectseatcontroller.selectedseats.length * double.parse(widget.fare)).toString()).obs;

                                                                          if ((selectseatcontroller.selectedseats.length >=
                                                                              4)) {
                                                                            Scaffold.of(context).showSnackBar(const SnackBar(
                                                                              content: Text("You cant Reserve more than 4 seats"),
                                                                              duration: Duration(milliseconds: 1000),
                                                                            ));
                                                                          }
                                                                        } else {
                                                                          selectseatcontroller
                                                                              .selectedseats
                                                                              .add(Rownum + viewSeatnumber);

                                                                          selectseatcontroller.totalcoast =
                                                                              double.parse((selectseatcontroller.selectedseats.length * double.parse(widget.fare)).toString()).obs;
                                                                        }
                                                                      }
                                                                    },
                                                                    child: Obx(
                                                                      () => Container(
                                                                          height: 35,
                                                                          width: 35,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            color: selectseatcontroller.booketseats.toString().contains(Rownum + viewSeatnumber)
                                                                                ? Colors.grey
                                                                                : selectseatcontroller.selectedseats.contains(Rownum + viewSeatnumber)
                                                                                    ? Colors.lightBlue
                                                                                    : Colors.white,
                                                                            image:
                                                                                const DecorationImage(
                                                                              image: AssetImage("lib/assets/images/seat.png"),
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                          child: Row(
                                                                            children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0),
                                                                                    child: Text(
                                                                                      Rownum + viewSeatnumber,
                                                                                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 8, color: Colors.black54),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(5.0, 5.0), //(x,y)
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "Selected Seats :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                softWrap: true,
                              ),
                              Obx(
                                () => selectseatcontroller.selectedseats
                                        .toString()
                                        .replaceAll("[]", "")
                                        .isEmpty
                                    ? const Text(
                                        " No Seats Selected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: 15),
                                      )
                                    : Text(
                                        selectseatcontroller.selectedseats
                                            .toString()
                                            .replaceAll("[", " ")
                                            .replaceAll("]", ""),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 15),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "Total Cost : ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Obx(
                                () => selectseatcontroller.selectedseats
                                        .toString()
                                        .replaceAll("[]", "")
                                        .isEmpty
                                    ? const Text(
                                        "0.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.green),
                                      )
                                    : Text(
                                        "${widget.fare}x${selectseatcontroller.selectedseats.length} ="
                                        " ${selectseatcontroller.totalcoast}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(08.0, 0.0, 8.0, 0.0),
                          child: DropdownSearch<String>(
                              mode: Mode.BOTTOM_SHEET,
                              showSearchBox: true,
                              items: Listofboarding_points,
                              showSelectedItems: false,

                              dropdownSearchDecoration: const InputDecoration(
                                labelText: "Select Boarding Point ",
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                suffixIcon: Icon(Icons.shop),
                                hintText: "Select Your Starting City",


                              ),
                              onChanged: (value) async {
                                setState(() {
                                  select_bording_Point = value;
                                });
                              },


                              selectedItem: select_bording_Point,
                              searchFieldProps: const TextFieldProps(
                                cursorColor: Colors.tealAccent,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (selectseatcontroller.selectedseats.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("you dont picked any seats"),
                                        duration:
                                            Duration(milliseconds: 1000)));
                              } else {
                                print(select_bording_Point.toString());

                                if (select_bording_Point.toString() == "null") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'please choose Your Boarding point'),
                                          duration:
                                              Duration(milliseconds: 1000)));
                                } else {
                                  addtopost(
                                      widget.id,
                                      selectseatcontroller.selectedseats,
                                      widget.fare,
                                      select_bording_Point.toString(),
                                      _dateTimebuyingTicke,
                                      Randomid);
                                }
                              }
                            },
                            child: Text("next"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addtopost(id, RxList<dynamic> selectedseats, String fare,
      String selectBordingPoint, String dateTimeOrder, String randomid) async {
    var deviceInfo = DeviceInfoPlugin();
    late String deviceId;

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor!;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.id!;
    } else {
      deviceId = 'No Id Found ';
    }
    seatreserve Seatreserve = seatreserve(
        status: 'reserved',
        bus_journey_date: dateTimeOrder,
        BusinfoID: id,
        boarding_point: selectBordingPoint,
        demo_user_id: randomid,
        seat_fare: fare,
        selectseat: selectedseats);



    var url = Uri.parse("https://btrs.ticket.symbexit.com/api/booked_seats");

    EasyLoading.show(status: "sending..");
    var response = await http.post(
      url,
      headers: {"Content-type": "application/json"},
      body: json.encode(Seatreserve.toJson()),
    );

    if (response.statusCode == 200) {
      EasyLoading.showSuccess("Your Order has ben placed ");
      print(randomid + "Reserved");

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Order_Confirmation(
                purchasingdate: dateTimeOrder,
                BusName: widget.BusName,
                DepartureCity: widget.departure,
                Destination: widget.destination,
                DepartureTime: widget.deaprtureTime,
                DepartureDay: widget.Busleavingday,
                tripdate: widget.TripDaTe,
                demoDevicID: randomid)),
      );
    } else {
      EasyLoading.showError("Opps".toString());
    }
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

List<String> Listofboarding_points = [
  "Kallaynpur",
  "Dhanmondi32",
  "Sydabad",
];
