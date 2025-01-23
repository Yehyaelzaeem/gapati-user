import 'cart_model.dart';
import 'order_details_model.dart';

class OrderModel {
  List<OrderModelData>? data;

  OrderModel({this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderModelData>[];
      json['data'].forEach((v) {
        data!.add(new OrderModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderModelData {
  int? id;
  String? name;
  String? status;
  String? statusLang;
  String? statusTripLang;
  dynamic price;
  dynamic deliveryPrice;
  dynamic discount;
  String? note;
  String? date;
  String? paymentStatus;
  String? paymentMethod;
  String? paymentMethodLang;
  String? image;
  String? phone;
  String? toAddress;
  String? lat;
  String? lng;
  List<OrderDetails>? orderDetails;
  TripModel? tripModel;
  OrderModelData(
      {this.id,
        this.name,
        this.price,
        this.status,
        this.deliveryPrice,
        this.paymentStatus,
        this.discount,
        this.note,
        this.statusTripLang,
        this.date,
        this.statusLang,
        this.paymentMethod,
        this.paymentMethodLang,
        this.image,
        this.phone,
        this.toAddress,
        this.lat,
        this.orderDetails,
        this.tripModel,
        this.lng,
      });

  OrderModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discount = json['discount'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
    tripModel = json['trip_data'] != null ? new TripModel.fromJson(json['trip_data']) : null;
    price = json['price'];
    deliveryPrice = json['delivery_price'];
    statusTripLang =json['trip_data']!=null && json['trip_data']['data']!=null  && json['trip_data']['data']['trip_status']!=null? json['trip_data']['data']['trip_status']:null;
    statusLang = json['status_lang'];
    note = json['note'];
    status = json['status'];
    date = json['date'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    paymentMethodLang = json['payment_method_lang'];
    image = json['image'];
    phone = json['phone'];
    toAddress = json['to_address'];
    lat = json['to_lat'];
    lng = json['to_lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['note'] = this.note;
    data['date'] = this.date;
    data['payment_method'] = this.paymentMethod;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['to_address'] = this.toAddress;
    data['to_lat'] = this.lat;
    data['to_lng'] = this.lng;
    return data;
  }
}

class TripModel {
  TripModelData? data;

  TripModel({this.data});

  TripModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new TripModelData.fromJson(json['data']);
    }
  }


}
class TripModelData {
   int? id;
   dynamic price;

   TripModelData({this.id,this.price});

  TripModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
  }
}