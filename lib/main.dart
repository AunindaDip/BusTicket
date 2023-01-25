import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:busticketreservation/Search_Ticket/Search_Ticket.dart';
import 'package:busticketreservation/SearchedBusInfro.dart';
import 'package:busticketreservation/main.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'topofNavigationbar.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => selectseat());

    return GetMaterialApp(
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
          duration: 4500,
          splash: Icons.bus_alert_outlined,
          backgroundColor: Colors.green,
          splashTransition: SplashTransition.slideTransition,
          nextScreen: const MyHomePage(title: "Btrs")),

      /*const MyHomePage(title: 'Flutter Demo Home Page'),*/
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
  String? select_destination_tcity;
  String _dayName = DateFormat('EEEE', 'en_US').format(DateTime.now());

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
      body: SafeArea(
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              const Padding(
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
              LayoutBuilder(
                builder:  (BuildContext context, BoxConstraints constraints){
                  return
         SingleChildScrollView(
           child: SizedBox(

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
                                  textTheme: const TextTheme(
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
                                    popupItemDisabled: (String s) =>
                                        s == select_destination_tcity,
                                    dropdownSearchDecoration: const InputDecoration(
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
                                    searchFieldProps: const TextFieldProps(
                                      cursorColor: Colors.tealAccent,
                                    )),
                              ),
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                    height: 10,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 4),
                                      child: (Icon(Icons.thumbs_up_down)),
                                    )),
                                SizedBox(width: 4),
                              ],
                            ),
                            SizedBox(height: 15),
                            Theme(
                              data: ThemeData(
                                textTheme: const TextTheme(
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
                                    popupItemDisabled: (String s) =>
                                        s == select_starting_tcity,
                                    dropdownSearchDecoration: const InputDecoration(
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
                                    searchFieldProps: const TextFieldProps(
                                      cursorColor: Colors.tealAccent,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
         );
                  },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2),
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
                            _dateTime,
                            style: const TextStyle(
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
                                  });
                                });
                              },
                              child: const Text("Change date",
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
              const SizedBox(
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
                        if (select_starting_tcity == null ||
                            select_starting_tcity.toString().isEmpty ||
                            select_destination_tcity == null ||
                            select_destination_tcity.toString().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Your destination or Staring city is empty'),
                                  duration: Duration(milliseconds: 1000)));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Searchedbus(
                                    leaving: select_starting_tcity.toString(),
                                    destination:
                                        select_destination_tcity.toString(),
                                    TripDaTe: _dateTime,
                                    date: _dayName.toString())),
                          );
                          // Proceed with the journey
                        }
                      },
                      child: const Text("Search For Bus ",
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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                myprofildrwaer(),
                myDrwaerlist(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String a = '';
  void OnItemchangestratingcity(String stratingcity) {
    if (stratingcity == select_destination_tcity) {
      // Display an error message or prevent the selection from being made
    } else {
      a = stratingcity;
    }
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

myDrwaerlist() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          icon: Icon(
            Icons.star_border_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(searchticket());
          },
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Search Ticket ",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextButton.icon(
            icon: Icon(
              Icons.animation,
              color: Colors.black,
            ),
            onPressed: () {},
            label: const Text(
              "Contact Us",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            )),
        TextButton.icon(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          onPressed: () {},
          label: const Text(
            "About us",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
