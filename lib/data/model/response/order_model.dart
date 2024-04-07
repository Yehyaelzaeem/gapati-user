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
  String? price;
  String? note;
  String? date;
  String? paymentMethod;
  String? image;

  OrderModelData(
      {this.id,
        this.name,
        this.price,
        this.note,
        this.date,
        this.paymentMethod,
        this.image});

  OrderModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    note = json['note'];
    date = json['date'];
    paymentMethod = json['payment_method'];
    image = json['image'];
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
    return data;
  }
}
