class businfomodel {
  String? id;
  String? bustypId;
  String? leavingFrom;
  String? goingTo;
  String? name;
  String? seattype;
  String? seatcapacity;
  String? fare;
  String? day;
  String? departureTime;
  String? description;

  String? createdAt;
  String? updatedAt;

  businfomodel(
      {this.id,
      this.bustypId,
      this.leavingFrom,
      this.goingTo,
      this.name,
      this.seattype,
      this.seatcapacity,
      this.fare,
      this.day,
      this.departureTime,
      this.description,
      this.createdAt,
      this.updatedAt});

  businfomodel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    bustypId = json['bustyp_id'].toString();
    leavingFrom = json['leaving_from'].toString();
    goingTo = json['going_to'].toString();
    name = json['name'].toString();
    seattype = json['seattype'].toString();
    seatcapacity = json['seatcapacity'].toString();
    fare = json['fare'].toString();
    day = json['day'].toString();
    departureTime = json['departure_time'].toString();
    description = json['description'].toString();

    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bustyp_id'] = this.bustypId;
    data['leaving_from'] = this.leavingFrom;
    data['going_to'] = this.goingTo;
    data['name'] = this.name;
    data['seattype'] = this.seattype;
    data['seatcapacity'] = this.seatcapacity;
    data['fare'] = this.fare;
    data['day'] = this.day;
    data['departure_time'] = this.departureTime;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
