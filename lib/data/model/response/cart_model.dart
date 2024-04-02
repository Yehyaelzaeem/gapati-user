class CartModel {
  CartModelData? data;

  CartModel({this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  CartModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CartModelData {
  int? id;
  Store? store;
  List<String>? branch;
  int? subTotal;
  int? deliveryFees;
  int? cartItemCount;
  int? tax;
  int? total;
  String? promoCode;
  List<Items>? items;

  CartModelData(
      {this.id,
        this.store,
        this.branch,
        this.subTotal,
        this.deliveryFees,
        this.cartItemCount,
        this.tax,
        this.total,
        this.promoCode,
        this.items});

  CartModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    store = json['store'] != null ?  Store.fromJson(json['store']) : null;
    branch = json['branch'].cast<String>();
    subTotal = json['sub_total'];
    deliveryFees = json['delivery_fees'];
    cartItemCount = json['cart_item_count'];
    tax = json['tax'];
    total = json['total'];
    promoCode = json['promo_code'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add( Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    data['branch'] = branch;
    data['sub_total'] = subTotal;
    data['delivery_fees'] = deliveryFees;
    data['cart_item_count'] = cartItemCount;
    data['tax'] = tax;
    data['total'] = total;
    data['promo_code'] = promoCode;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Store {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;
  int? storeType;
  bool? status;

  Store(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.image,
        this.storeType,
        this.status});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    storeType = json['store_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['image'] = image;
    data['store_type'] = storeType;
    data['status'] = status;
    return data;
  }
}

class Items {
  int? itemCartId;
  int? id;
  String? name;
  dynamic price;
  dynamic itemPrice;
  dynamic extraPrice;
  String? image;
  int? qty;
  Extra? extra;

  Items(
      {this.itemCartId,
        this.id,
        this.name,
        this.price,
        this.itemPrice,
        this.extraPrice,
        this.image,
        this.qty,
        this.extra});

  Items.fromJson(Map<String, dynamic> json) {
    itemCartId = json['item_cart_id'];
    id = json['id'];
    name = json['name'];
    price = json['price'];
    itemPrice = json['item_price'];
    extraPrice = json['extra_price'];
    image = json['image'];
    qty = json['qty'];
    extra = json['extra'] != null ?  Extra.fromJson(json['extra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['item_cart_id'] =itemCartId;
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['item_price'] = itemPrice;
    data['extra_price'] = extraPrice;
    data['image'] = image;
    data['qty'] = qty;
    if (extra != null) {
      data['extra'] = extra!.toJson();
    }
    return data;
  }
}

class Extra {
  List<ExtraData>? data;

  Extra({this.data});

  Extra.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ExtraData>[];
      json['data'].forEach((v) {
        data!.add( ExtraData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExtraData {
  int? id;
  String? name;
  String? price;

  ExtraData({this.id, this.name, this.price});

  ExtraData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
