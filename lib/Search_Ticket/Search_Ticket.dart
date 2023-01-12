import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Mobilenumbersearch.dart';
import 'searchbypnr.dart';

class searchticket extends StatefulWidget {
  const searchticket({Key? key}) : super(key: key);

  @override
  _searchticketState createState() => _searchticketState();
}

class _searchticketState extends State<searchticket> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            width: MediaQuery.of(context).size.width * .9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  20.0,
                ),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Search your Ticket here  ",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ),
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
            ),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {}),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Expanded(
                  child: Tab(
                      icon: Icon(Icons.book_online),
                      text: "Search by phone Number")),
              Expanded(
                  child: Tab(
                      icon: Icon(Icons.wb_sunny_rounded),
                      text: "Search by Pnr Number")),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(children: [
          mobilenumbersearch(),
          searchbypnnr(),
        ]),
      ),
    );
  }
}
