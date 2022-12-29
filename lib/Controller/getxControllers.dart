import 'dart:convert';

import 'package:busticketreservation/ModelClasses/sear_reserveatiomodel.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class selectseat extends GetxController
{
 RxList selectedseats =[].obs;
 RxList  booketseats=[].obs;

  RxDouble totalcoast=0.0.obs ;
  RxString ReserVationdate=''.obs;

 var box = GetStorage();



}