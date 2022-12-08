class seatreserve
{
  String? Businfo,setquantity,devicetoken;
      List<String>seatnumbers=[];

  seatreserve(
      { this.Businfo, required this.setquantity, required this.devicetoken,
        required this.seatnumbers


      });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businfo_id'] = this.Businfo;
    data['setquantity'] = this.setquantity;
    data['devicetoken'] = this.devicetoken;

    data['seatnumbers'] = this.seatnumbers;
    return data;
  }







}