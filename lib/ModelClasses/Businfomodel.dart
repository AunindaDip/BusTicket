class businfomodel {
  String? id;
  String? bustypId;
  String? tripId;
  String? leavingFrom;
  String? goingTo;
  String? name;
  String? seatcapacity;
  String? fare;
  String? day;
  String? row;
  String? coloumn;
  String? departureTime;
  String? createdAt;
  String? updatedAt;

  businfomodel(
      {
        this.id,
        this.bustypId,
        this.tripId,
        this.leavingFrom,
        this.goingTo,
        this.name,
        this.seatcapacity,
        this.fare,
        this.day,
        this.row,
        this.coloumn,
        this.departureTime,
        this.createdAt,
        this.updatedAt});

  businfomodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bustypId = json['bustypId'];
    tripId = json['tripId'];
    leavingFrom = json['leavingFrom'];
    goingTo = json['goingTo'];
    name = json['name'];
    seatcapacity = json['seatcapacity'];
    fare = json['fare'];
    day = json['day'];
    row = json['row'];
    coloumn = json['coloumn'];
    departureTime = json['departure_time'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bustypId'] = this.bustypId;
    data['tripId'] = this.tripId;
    data['leavingFrom'] = this.leavingFrom;
    data['goingTo'] = this.goingTo;
    data['name'] = this.name;
    data['seatcapacity'] = this.seatcapacity;
    data['fare'] = this.fare;
    data['day'] = this.day;
    data['row'] = this.row;
    data['coloumn'] = this.coloumn;
    data['departure_time'] = this.departureTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}