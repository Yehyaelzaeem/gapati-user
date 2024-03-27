class HomeModel {
  HomeModelData? data;
  OfferData? offerData;

  HomeModel({this.data, this.offerData});

  HomeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? HomeModelData.fromJson(json['data']) : null;
    offerData = json['offer_data'] != null
        ? OfferData.fromJson(json['offer_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (offerData != null) {
      data['offer_data'] = offerData!.toJson();
    }
    return data;
  }
}

class HomeModelData {
  List<DataHome>? data;

  HomeModelData({this.data});

  HomeModelData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataHome>[];
      json['data'].forEach((v) {
        data!.add(DataHome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataHome {
  int? id;
  String? name;
  String? category;
  String? image;
  int? rate;
  Discount? discount;
  String? distance;
  bool? opening;

  DataHome(
      {this.id,
        this.name,
        this.category,
        this.image,
        this.rate,
        this.discount,
        this.distance,
        this.opening});

  DataHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
    rate = json['rate'];
    discount = json['discount'] != null
        ? Discount.fromJson(json['discount'])
        : null;
    distance = json['distance'];
    opening = json['opening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['image'] = image;
    data['rate'] = rate;
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }
    data['distance'] = distance;
    data['opening'] = opening;
    return data;
  }
}

class Discount {
  String? name;
  String? offerType;
  String? startDate;
  String? endDate;
  String? percentage;

  Discount(
      {this.name,
        this.offerType,
        this.startDate,
        this.endDate,
        this.percentage});

  Discount.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    offerType = json['offer_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['offer_type'] = offerType;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['percentage'] = percentage;
    return data;
  }
}

class OfferData {
  List? data;

  OfferData({this.data});

  OfferData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Null>[];
      json['data'].forEach((v) {
        // data!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
