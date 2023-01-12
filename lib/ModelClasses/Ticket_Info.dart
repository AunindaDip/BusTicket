class ticketmodel {
  String? busNumber;
  String? tripId;
  String? day;
  String? from;
  String? to;
  String? businfoId;
  String? price;
  String? boardingPoint;
  String? seatName;
  String? busJourneyDate;
  String? pName;
  String? pEmail;
  String? pPhone;
  String? demoUserId;
  String? transactionId;

  ticketmodel(
      {
        this.busNumber,
        this.tripId,
        this.day,
        this.from,
        this.to,
        this.businfoId,
        this.price,
        this.boardingPoint,
        this.seatName,
        this.busJourneyDate,
        this.pName,
        this.pEmail,
        this.pPhone,
        this.demoUserId,
        this.transactionId});

  ticketmodel.fromJson(Map<String, dynamic> json) {
    busNumber = json['bus_number'];
    tripId = json['trip_id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    businfoId = json['businfo_id'];
    price = json['price'];
    boardingPoint = json['boarding_point'];
    seatName = json['seat_name'];
    busJourneyDate = json['bus_journey_date'];
    pName = json['p_name'];
    pEmail = json['p_email'];
    pPhone = json['p_phone'];
    demoUserId = json['demo_user_id'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bus_number'] = this.busNumber;
    data['trip_id'] = this.tripId;
    data['day'] = this.day;
    data['from'] = this.from;
    data['to'] = this.to;
    data['businfo_id'] = this.businfoId;
    data['price'] = this.price;
    data['boarding_point'] = this.boardingPoint;
    data['seat_name'] = this.seatName;
    data['bus_journey_date'] = this.busJourneyDate;
    data['p_name'] = this.pName;
    data['p_email'] = this.pEmail;
    data['p_phone'] = this.pPhone;
    data['demo_user_id'] = this.demoUserId;
    data['transaction_id'] = this.transactionId;
    return data;
  }
}