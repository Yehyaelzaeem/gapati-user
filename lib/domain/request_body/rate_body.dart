class RateBody{
  String? orderId;
  String? rate;
  String? note;

  RateBody({this.orderId, this.rate, this.note});

  Map<String, dynamic> toJson() {
    return {
      "order_id": this.orderId,
      "rate": this.rate,
      "notes": this.note,
    };
  }
}