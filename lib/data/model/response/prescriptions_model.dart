class PrescriptionsModel {
  List<PrescriptionsModelData>? data;

  PrescriptionsModel({this.data});

  PrescriptionsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PrescriptionsModelData>[];
      json['data'].forEach((v) {
        data!.add(new PrescriptionsModelData.fromJson(v));
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

class PrescriptionsModelData {
  int? id;
  String? image;
  int? deliveryPrice;
  int? price;
  String? note;
  String? status;
  String? storesNote;
  Store? store;
  Branch? branch;
  Client? client;

  PrescriptionsModelData(
      {this.id,
        this.image,
        this.deliveryPrice,
        this.price,
        this.note,
        this.status,
        this.storesNote,
        this.store,
        this.branch,
        this.client});

  PrescriptionsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    deliveryPrice = json['delivery_price'];
    price = json['price'];
    note = json['note'];
    status = json['status'];
    storesNote = json['stores_note'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['delivery_price'] = this.deliveryPrice;
    data['price'] = this.price;
    data['note'] = this.note;
    data['status'] = this.status;
    data['stores_note'] = this.storesNote;
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Store {
  String? name;
  int? id;

  Store({this.name, this.id});

  Store.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? email;
  dynamic lat;
  dynamic lng;
  // Store? region;

  Branch(
      {this.id,
        this.name,
        this.address,
        this.phone,
        this.email,
        this.lat,
        this.lng,
        // this.region
      });

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    // region = json['region'] != null ? new Store.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    // if (this.region != null) {
    //   data['region'] = this.region!.toJson();
    // }
    return data;
  }
}

class Client {
  String? name;
  String? phone;
  String? address;
  int? addressId;
  String? addressNot;
  Location? location;
  String? image;

  Client(
      {this.name,
        this.phone,
        this.address,
        this.addressId,
        this.addressNot,
        this.location,
        this.image});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    addressId = json['address_id'];
    addressNot = json['address_not'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['address_id'] = this.addressId;
    data['address_not'] = this.addressNot;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['image'] = this.image;
    return data;
  }
}

class Location {
  String? lat;
  String? lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
