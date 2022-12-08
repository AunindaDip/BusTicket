class seatinfo {
  String? businfoId;
  String? row;
  String? coloumn;
  String? id;
  String? seat_name;
  String?status;

  seatinfo(
      {this.businfoId, this.row, this.coloumn, this.id,this.status, this.seat_name});

  seatinfo.fromJson(Map<String, dynamic> json) {
    businfoId = json['businfo_id'];
    row = json['row'];
    coloumn = json['coloumn'];
    id = json['id'];
    status=json['status'];
    seat_name = json['seat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businfo_id'] = this.businfoId;
    data['row'] = this.row;
    data['coloumn'] = this.coloumn;
    data['id'] = this.id;
    data['status']=this.status;
    data['seat_name'] = this.seat_name;
    return data;
  }
}