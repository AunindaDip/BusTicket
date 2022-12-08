import 'dart:convert';

import 'package:busticketreservation/ModelClasses/sear_reserveatiomodel.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class selectseat extends GetxController
{
 var selectedseats = List<seatreserve>.empty(growable: true).toList().obs;
 var box = GetStorage();


 Savedata() => {box.write('My_Seat_Key', jsonEncode(selectedseats))};

}