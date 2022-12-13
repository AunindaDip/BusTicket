import 'dart:ui';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:busticketreservation/SearchedBusInfro.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>selectseat());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _dateTime = DateFormat.yMMMMd('en_US').format(DateTime.now());
  String? select_starting_tcity;
  String _dayName = DateFormat('EEEE', 'en_US').format(DateTime.now());
  String? select_destination_tcity;

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
      body: SafeArea(
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Search and Buy Bus Ticket',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.320,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
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
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 4),
                          child: Theme(
                            data: ThemeData(
                              textTheme: TextTheme(
                                  subtitle1: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            child: DropdownSearch<String>(
                                mode: Mode.DIALOG,
                                showSearchBox: true,
                                items: citesofbd,
                                showSelectedItems: false,
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: "From",
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  suffixIcon: Icon(Icons.shop),
                                  hintText: "Select Your Starting City",
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    select_starting_tcity = value;
                                  });
                                },
                                selectedItem: select_starting_tcity,
                                searchFieldProps: TextFieldProps(
                                  cursorColor: Colors.tealAccent,
                                )),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                                height: 10,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 20.0, 20.0, 4),
                                  child: (Icon(Icons.thumbs_up_down)),
                                )),
                            SizedBox(width: 4),
                            Center(
                              child: SizedBox(
                                  height: 10,
                                  width: 50,
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 20.0, 20.0, 20),
                                      child: Image.asset(
                                        "lib/assets/images/dip.jpg",
                                        fit: BoxFit.fitWidth,
                                      ))),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Theme(
                          data: ThemeData(
                            textTheme: TextTheme(
                                subtitle1: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20),
                            child: DropdownSearch<String>(
                                mode: Mode.DIALOG,
                                showSearchBox: true,
                                items: citesofbd,
                                showSelectedItems: true,
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: "To",
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  suffixIcon: Icon(Icons.shop),
                                  hintText: "Select Your Destination  City",
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    select_destination_tcity = value;
                                  });
                                },
                                selectedItem: select_destination_tcity,
                                searchFieldProps: TextFieldProps(
                                  cursorColor: Colors.tealAccent,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
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
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2),
                          child: Text(
                            "Please Select Your Journey Date ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20),
                          child: Text(
                            _dateTime == null
                                ? "Please Select Your Journey Date "
                                : _dateTime,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                                border: Border.all(color: Colors.green)),
                            child: TextButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 15)),
                                ).then((date) {
                                  setState(() {
                                    _dateTime = DateFormat.yMMMMd('en_US')
                                        .format(date!);
                                    _dayName = DateFormat('EEEE', 'en_US')
                                        .format(date!);
                                    print(_dayName);
                                  });
                                });
                              },
                              child: Text("Change date",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                      border: Border.all(color: Colors.green),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(5.0, 5.0), //(x,y)
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Searchedbus(
                                  leaving: select_starting_tcity.toString(),
                                  destination:
                                      select_destination_tcity.toString(),
                                  date: _dayName.toString())),
                        );
                      },
                      child: Text("Search For Bus ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20)),
                    ),
                  ),
                ),
              )
            ])),
      ),
    );
  }
}

List<String> citesofbd = [
  "Dhaka",
  "Faridpur",
  "Gazipur",
  "Gopalganj",
  "Jamalpur",
  "Kishoreganj",
  "Madaripur",
  "Manikganj",
  "Munshiganj",
  "Mymensingh",
  "Narayanganj",
  "Narsingdi",
  "Netrokona",
  "Rajbari",
  "Shariatpur",
  "Sherpur",
  "Tangail",
  "Bogra",
  "Joypurhat",
  "Naogaon",
  "Natore",
  "Nawabganj",
  "Pabna",
  "Rajshahi",
  "Sirajgonj",
  "Dinajpur",
  "Gaibandha",
  "Kurigram",
  "Lalmonirhat",
  "Nilphamari",
  "Panchagarh",
  "Rangpur",
  "Thakurgaon",
  "Barguna",
  "Barisal",
  "Bhola",
  "Jhalokati",
  "Patuakhali",
  "Pirojpur",
  "Bandarban",
  "Brahmanbaria",
  "Chandpur",
  "Chittagong",
  "Comilla",
  "Cox's Bazar",
  "Feni",
  "Khagrachari",
  "Lakshmipur",
  "Noakhali",
  "Rangamati",
  "Habiganj",
  "Maulvibazar",
  "Sunamganj",
  "Sylhet",
  "Bagerhat",
  "Chuadanga",
  "Jessore",
  "Jhenaidah",
  "Khulna",
  "Kushtia",
  "Magura",
  "Meherpur",
  "Narail",
  "Satkhira",
];
String a = '';
void OnItemchangestratingcity(String? stratingcity) {
  a == stratingcity;
  print(stratingcity);
}
