
import 'package:get/get.dart';

class seatreserve {
  String?
      BusinfoID,
      demo_user_id,
      boarding_point,
      seat_fare,
      bus_journey_date,
      status;
  RxList selectseat;

  seatreserve(
      {
      required this.boarding_point,
      required this.bus_journey_date,
      required this.status,
      required this.seat_fare,
      required this.BusinfoID,
      required this.demo_user_id,
      required this.selectseat});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();


    data['boarding_point'] = this.boarding_point;
    data['bus_journey_date'] = this.bus_journey_date;
    data['status'] = this.status;
    data['seat_fare'] = this.seat_fare;
    data['businfo_id'] = this.BusinfoID;
    data['demo_user_id'] = this.demo_user_id;
    data['seat_name'] = this.selectseat;
    return data;
  }
}
