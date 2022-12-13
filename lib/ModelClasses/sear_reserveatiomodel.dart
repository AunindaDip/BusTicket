import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:busticketreservation/Controller/getxControllers.dart';
import 'package:get/get.dart';

class seatreserve
{
  String? BusinfoID,setquantity,devicetoken;
  RxList selectseat;


  seatreserve(

      { required this.BusinfoID, required this.setquantity, required this.devicetoken,
        required this. selectseat });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businfo_id'] = this.BusinfoID;
    data['setquantity'] = this.setquantity;
    data['devicetoken'] = this.devicetoken;
    data['selectseat'] = this.selectseat;
    return data;
  }







}