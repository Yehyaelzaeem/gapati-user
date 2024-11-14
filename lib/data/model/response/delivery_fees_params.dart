class DeliveryFeesParams {
  String? addressId;
  String? branchId;
  String? branchLat;
  String? branchLong;

  DeliveryFeesParams({this.addressId, this.branchId, this.branchLat, this.branchLong});

  Map<String, dynamic> toMap() {
    return {
      'address_id': this.addressId,
      'branch_lng': this.branchLong,
      'branch_lat': this.branchLat,
    };
  }

  factory DeliveryFeesParams.fromMap(Map<String, dynamic> map) {
    return DeliveryFeesParams(
      addressId: map['address_id'] as String,
      branchLat: map['branch_lat'] as String,
      branchLong: map['branch_lng'] as String,
    );
  }
}