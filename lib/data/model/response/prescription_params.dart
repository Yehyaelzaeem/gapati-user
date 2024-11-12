import 'dart:io';

class PrescriptionParams {
  String? storeId;
  String? addressId;
  String? brandId;
  File? prescription;
  String? note;

  PrescriptionParams({this.storeId, this.prescription, this.note, this.addressId, this.brandId});

  PrescriptionParams.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    prescription = json['prescription'];
    note = json['note'];
    brandId = json['branch_id'];
    addressId = json['address_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['prescription'] = this.prescription!.path;
    data['address_id'] = this.addressId;
    data['branch_id'] = this.brandId;
    data['note'] = this.note;
    return data;
  }
}