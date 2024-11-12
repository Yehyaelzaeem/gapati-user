class AcceptPrescriptionParams{
  int? id;
  String? paymentMethod;

  AcceptPrescriptionParams({this.id, this.paymentMethod});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'payment_method': this.paymentMethod,
    };
  }

  factory AcceptPrescriptionParams.fromMap(Map<String, dynamic> map) {
    return AcceptPrescriptionParams(
      id: map['id'] as int,
      paymentMethod: map['payment_method'] as String,
    );
  }
}