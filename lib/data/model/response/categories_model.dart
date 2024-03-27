class CategoriesModel {
  List<CategoriesModelData>? data;

  CategoriesModel({this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoriesModelData>[];
      json['data'].forEach((v) {
        data!.add(CategoriesModelData.fromJson(v));
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

class CategoriesModelData {
  int? id;
  String? name;
  String? icon;

  CategoriesModelData({this.id, this.name, this.icon});

  CategoriesModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}
