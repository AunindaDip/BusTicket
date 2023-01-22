import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:busticketreservation/ModelClasses/Ticket_Info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PnrTicketResults extends StatefulWidget {
  final String pnr;

  const PnrTicketResults({Key? key, required this.pnr}) : super(key: key);

  @override
  _PnrTicketResultstState createState() => _PnrTicketResultstState(pnr);
}

class _PnrTicketResultstState extends State<PnrTicketResults> {
  _PnrTicketResultstState(pnr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BTRS"),
      ),
      body: FutureBuilder(
        future: getTicket(widget.pnr),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print(widget.pnr.toString() + "dancing");

            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            print(widget.pnr.toString() + "gloomy");

            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int Index) {
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
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 8.0, 2),
                                  child: Text(
                                    snapshot.data[Index].pName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Download Ticket "))
                            ],
                          ),
                        ),
                      ))
                    ],
                  );
                });
          }
         if (snapshot.hasError) {
            print(snapshot.hasError.toString());


            return Center();
          } else {
            print(widget.pnr.toString() + "happy");

            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<List<ticketmodel>> getTicket(String a) async {
  var url = Uri.parse("http://btrs.ticket.symbexit.com/api/ticketDetails");
  var data = await http.get(url);
  var jsonData = json.decode(data.body);
  final list = jsonData as List<dynamic>;
  return list.map((e) => ticketmodel.fromJson(e)).where((element) => element.transactionId == a).toList();
}