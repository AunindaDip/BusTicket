import 'dart:convert';
import 'dart:math';
import 'package:busticketreservation/ModelClasses/OrderConfiramtionOdel.dart';
import 'package:busticketreservation/main.dart';
import 'package:flutter/services.dart';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class Order_Confirmation extends StatefulWidget {
  final String purchasingdate,
      BusName,
      DepartureCity,
      Destination,
      DepartureTime,
      tripdate,
      DepartureDay,
      demoDevicID;

  const Order_Confirmation(
      {Key? key,
      required this.purchasingdate,
      required this.BusName,
      required this.DepartureCity,
      required this.Destination,
      required this.DepartureTime,
      required this.tripdate,
      required this.DepartureDay,
      required this.demoDevicID}
      )
      : super(key: key);

  @override
  _Order_ConfirmationState createState() => _Order_ConfirmationState(
        purchasingdate,
        BusName,
        DepartureCity,
        Destination,
        DepartureTime,
        tripdate,
        DepartureDay,
        demoDevicID,
      );
}

class _Order_ConfirmationState extends State<Order_Confirmation> {
  _Order_ConfirmationState(purchasingdate, BusName, DepartureCity, Destination,
      DepartureTime, tripdate, DepartureDay, demoDevicID);
  var NameController = TextEditingController();
  var Emailcontroller = TextEditingController();
  var MObilecontroller = TextEditingController();

  final selectseat selectseatcontroller = Get.find();





  Future<bool?> showWarnig(BuildContext context) async => showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("if you leave the page your booked ticket will be lost "),
      actions: [
        ElevatedButton(
          child: const Text("No"),
          onPressed: () => Navigator.pop(context, false),
        ),
        ElevatedButton(
          child: const Text("Yes"),
          onPressed: () =>  Get.offAll(const MyHomePage(
            title: 'Dip',
          )),
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      final sholdpop = await showWarnig(context);
      return sholdpop ?? false;
    },

       child: Scaffold(
        appBar: AppBar(
          title: const Text("BTRS"),





        ),
        body: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                      height: 700,
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
                                const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 0.0),
                            child: Center(
                                child: Text(
                              widget.BusName,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 0.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Trip Date : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${widget.tripdate} ,${widget.DepartureTime}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 0.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 5.0),
                                  child: Text(
                                    "From:",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 8.0, 8.0, 5.0),
                                  child: Text(widget.DepartureCity,
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 5.0),
                                  child: Text(
                                    "To:",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 8.0, 8.0, 5.0),
                                  child: Text(widget.Destination,
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 5.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 5.0),
                                  child: Text(
                                    "Purchasing Date:",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 8.0, 8.0, 5.0),
                                  child: Text(widget.purchasingdate,
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 5.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 5.0),
                                  child: Text("Selected Seat Numbers : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 8.0, 8.0, 5.0),
                                    child: Text(
                                        selectseatcontroller.selectedseats
                                            .toString()
                                            .replaceAll("]", "")
                                            .replaceAll("[", " "),
                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 5.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 5.0),
                                  child: Text(
                                    "Total Coast : ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 8.0, 8.0, 5.0),
                                  child: Text(
                                      selectseatcontroller.totalcoast.toString(),
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 5.0),
                            child: Row(
                              children: const [
                                Center(
                                  child: Text("Contact Details : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 5.0),
                            child: Column(
                              children: [
                                TextField(
                                  controller: NameController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3,
                                            color: Colors.black), //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(50.0),
                                      ),
                                      hintText: "Name",
                                      labelText: 'Please state your Name',
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            NameController.clear();
                                          },
                                          icon: const Icon(Icons.clear))),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextField(
                                  controller: Emailcontroller,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3,
                                            color: Colors.black), //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(50.0),
                                      ),
                                      hintText: "Email",
                                      labelText:
                                          'Please state your Email Address',
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            Emailcontroller.clear();
                                          },
                                          icon: const Icon(Icons.clear))),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextField(
                                  controller: MObilecontroller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3,
                                            color: Colors.black), //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      hintText: "Mobile",
                                      labelText:
                                          'Please state your Mobile Number ',
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            MObilecontroller.clear();
                                          },
                                          icon: const Icon(Icons.clear))),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Onlinepay(
                                          selectseatcontroller.totalcoast
                                              .toString(),
                                          NameController.text.toString(),
                                          MObilecontroller.text.toString(),
                                          Emailcontroller.text.toString(),
                                          widget.demoDevicID.toString());
                                    },
                                    child: Text("pay Now "))
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
    ),
    );
  }
}

void Onlinepay(String payable, email, name, mobile, demoDevicID) async {
  int otp = Random().nextInt(999999);
  int noOfOtpDigit = 6;
  while (otp.toString().length != noOfOtpDigit) {
    otp = Random().nextInt(999999);
  }
  String otpString = otp.toString();



  Sslcommerz sslstart = Sslcommerz(
      initializer: SSLCommerzInitialization(
          ipn_url: "https://btrs.ticket.symbexit.com/api/ipn",
          store_id: "sym616d499239c50",
          store_passwd: "sym616d499239c50@ssl",
          total_amount: double.parse(payable),
          currency: SSLCurrencyType.BDT,
          tran_id: otpString,
          product_category: "hello",
          sdkType: "SSLCSdkType.TESTBOX"));



  try {
    SSLCTransactionInfoModel result = await sslstart.payNow();

    if (result.status!.toLowerCase() == "failed") {


      EasyLoading.showSuccess("Your Order  ");

    } else {
      palaceorder(name, mobile, email, result.cardType, result.tranId,
          result.currencyType, payable, demoDevicID, result.status);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}































void palaceorder(String name, mobile, email, cardtype, tranID, currencytype,
    payable, demoDevicID, status) async {
  OrderConfirmationmodel orderConfirmationmodel = OrderConfirmationmodel(
    name: email,
    email: mobile,
    phone: name,
    amount: payable,
    address: "",
    status: "Transaction Done",
    paymentType: cardtype,
    brand: "Bus Ticket",
    transactionId: tranID,
    currency: currencytype,
    demoUserId: demoDevicID,
  );

  var url = Uri.parse("https://btrs.ticket.symbexit.com/api/order");


  EasyLoading.show(status: "sending..");
  var response = await http.post(
    url,
    headers: {"Content-type": "application/json"},
    body: json.encode(orderConfirmationmodel.toJson()),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    EasyLoading.showSuccess("Your Order has ben placed ");
    Get.offAll(const MyHomePage(
      title: 'Dip',
    ));
  } else {


    EasyLoading.showError("Opps".toString());
  }
}
