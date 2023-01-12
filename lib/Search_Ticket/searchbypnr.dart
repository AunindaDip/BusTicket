import 'package:busticketreservation/Search_Ticket/pnrticketresults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class searchbypnnr extends StatefulWidget {
  @override
  _searchbypnnrState createState() => _searchbypnnrState();
}

class _searchbypnnrState extends State<searchbypnnr> {
  var pnrcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    {

      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Container(
                width: 400,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(width: 8, color: Colors.green),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: pnrcontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Pnr Number",
                        ),
                        onChanged: (value)
                        {
                          setState(()
                          {
                             value = pnrcontroller.text.toString() ;
                          }
                          );
                        }


                        ,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: ElevatedButton(
                onPressed: () {
                if (pnrcontroller.text.toString().isEmpty)
                {ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                        Text("please enter a Pnr Number"),
                        duration:
                        Duration(milliseconds: 1000)));

                }
                else
                {
                  Get.to(PnrTicketResults(pnr: pnrcontroller.text.toString(),));
                }




                },
                child: Text('Search'),
              ),
            )
          ],
        ),
      );
    }
  }
}
