class BannersModel {
  BannersModelData? data;

  BannersModel({this.data});

  BannersModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new BannersModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BannersModelData {
  List<BannersData>? data;

  BannersModelData({this.data});

  BannersModelData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BannersData>[];
      json['data'].forEach((v) {
        data!.add(new BannersData.fromJson(v));
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

class BannersData {
  int? id;
  String? image;

  BannersData({this.id, this.image, });

  BannersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
