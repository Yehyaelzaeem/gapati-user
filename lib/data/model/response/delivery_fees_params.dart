class DeliveryFeesParams {
  String? addressId;
  String? branchId;

  DeliveryFeesParams({this.addressId, this.branchId});

  Map<String, dynamic> toMap() {
    return {
      'address_id': this.addressId,
      'branch_id': this.branchId,
    };
  }

  factory DeliveryFeesParams.fromMap(Map<String, dynamic> map) {
    return DeliveryFeesParams(
      addressId: map['address_id'] as String,
      branchId: map['branch_id'] as String,
    );
  }
}