import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:intl/intl.dart';


class seat_view extends StatefulWidget {
  const seat_view({Key? key}) : super(key: key);

  @override
  _seat_viewState createState() => _seat_viewState();
}

class _seat_viewState extends State<seat_view> {
  bool isActive = true;
  int? selectedIndex;
  HashSet selecteditem=new HashSet();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (Index) => const StaggeredTile.fit(
            1,
          ),
          mainAxisSpacing: 1,
          crossAxisSpacing: 2,
          crossAxisCount: 4,
          itemCount: 42,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                }
                );
              },
              child: Card(
                  color: selectedIndex == index
                      ? Colors.amber
                      : Colors.transparent,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 30,
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: new DecorationImage(
                                        image: new AssetImage(
                                            "lib/assets/images/bus.jpg"))),
                              ),
                            ],
                          )
                        ]
                    ),
                  )
              ),
            );
          },
        ),
      ),
    );
  }
  void multipleseat

      (
      
      )
  {


  }
}
