class OrderConfirmationmodel {
  String? name;
  String? email;
  String? phone;
  String? amount;
  String? address;
  String? status;
  String? paymentType;
  String? brand;
  String? transactionId;
  String? currency;
  String? demoUserId;

  OrderConfirmationmodel(
      {this.name,
        this.email,
        this.phone,
        this.amount,
        this.address,
        this.status,
        this.paymentType,
        this.brand,
        this.transactionId,
        this.currency,
        this.demoUserId});

  OrderConfirmationmodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    amount = json['amount'];
    address = json['address'];
    status = json['status'];
    paymentType = json['payment_type'];
    brand = json['brand'];
    transactionId = json['transaction_id'];
    currency = json['currency'];
    demoUserId = json['demo_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['amount'] = this.amount;
    data['address'] = this.address;
    data['status'] = this.status;
    data['payment_type'] = this.paymentType;
    data['brand'] = this.brand;
    data['transaction_id'] = this.transactionId;
    data['currency'] = this.currency;
    data['demo_user_id'] = this.demoUserId;
    return data;
  }
}