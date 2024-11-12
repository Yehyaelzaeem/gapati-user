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
  dynamic price;
  dynamic deliveryPrice;
  String? note;
  String? date;
  String? paymentMethod;
  String? image;
  String? phone;
  String? toAddress;
  String? lat;
  String? lng;
  List<OrderDetails>? orderDetails;

  OrderModelData(
      {this.id,
        this.name,
        this.price,
        this.status,
        this.deliveryPrice,
        this.note,
        this.date,
        this.statusLang,
        this.paymentMethod,
        this.image,
        this.phone,
        this.toAddress,
        this.lat,
        this.orderDetails,
        this.lng,
      });

  OrderModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
    price = json['price'];
    deliveryPrice = json['delivery_price'];
    statusLang = json['status_lang'];
    note = json['note'];
    status = json['status'];
    date = json['date'];
    paymentMethod = json['payment_method'];
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
