class StoreTypesModel {
  StoreTypesModelData? data;

  StoreTypesModel({this.data});

  StoreTypesModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new StoreTypesModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class StoreTypesModelData {
  List<StoreTypesData>? data;

  StoreTypesModelData({this.data});

  StoreTypesModelData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StoreTypesData>[];
      json['data'].forEach((v) {
        data!.add(new StoreTypesData.fromJson(v));
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

class StoreTypesData {
  int? id;
  String? name;
  String? icon;

  StoreTypesData({this.id, this.name, this.icon, });

  StoreTypesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
