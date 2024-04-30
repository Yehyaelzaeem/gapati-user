class ItemExtraModel {
  List<ItemExtraModelData>? data;
  ItemExtraModel({this.data});
  ItemExtraModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ItemExtraModelData>[];
      json['data'].forEach((v) {
        data!.add(ItemExtraModelData.fromJson(v));
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

class ItemExtraModelData {
  int? id;
  String? name;
  String? price;

  ItemExtraModelData({this.id, this.name, this.price});

  ItemExtraModelData.fromJson(Map<String, dynamic> json) {
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
