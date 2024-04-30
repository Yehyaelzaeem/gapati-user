class SearchModel {
  List<SearchModelData>? data;

  SearchModel({this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SearchModelData>[];
      json['data'].forEach((v) {
        data!.add(new SearchModelData.fromJson(v));
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

class SearchModelData {
  int? id;
  String? name;
  String? category;
  String? image;
  String? banner;
  int? rate;
  Discount? discount;
  String? distance;
  bool? opening;

  SearchModelData(
      {this.id,
        this.name,
        this.category,
        this.image,
        this.banner,
        this.rate,
        this.discount,
        this.distance,
        this.opening});

  SearchModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
    banner = json['banner'];
    rate = json['rate'];
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
    distance = json['distance'];
    opening = json['opening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['image'] = this.image;
    data['banner'] = this.banner;
    data['rate'] = this.rate;
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    data['distance'] = this.distance;
    data['opening'] = this.opening;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['offer_type'] = this.offerType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['percentage'] = this.percentage;
    return data;
  }
}
