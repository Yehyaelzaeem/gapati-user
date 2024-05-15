class CheckOutModel {
  String name;
  String addressId;
  String paymentMethod;
  String note;
  String storeId;
  String branchId;
  List<ItemModel> items;

  CheckOutModel({
    required this.name,
    required this.addressId,
    required this.paymentMethod,
    required this.note,
    required this.storeId,
    required this.branchId,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address_id': addressId,
      'payment_method': paymentMethod,
      'note': note,
      'store_id': storeId,
      'branch_id': branchId,
      'item': items.map((item) => item.toJson()).toList(),
    };
  }
}

class ItemModel {
  String itemId;
  String qty;
  String note;
  List<ExtraModel> extras;

  ItemModel({
    required this.itemId,
    required this.qty,
    required this.note,
    required this.extras,
  });

  Map<String, dynamic> toJson() {
    if(extras.isNotEmpty){
      return {
        'item_id': itemId,
        'qty': qty,
        'note': 'note',
        'extras': extras.map((extra) => extra.toJson()).toList(),
      };
    }
  else{
      return {
        'item_id': itemId,
        'qty': qty,
        'note': 'note',
      };

    }
  }
}

class ExtraModel {
  String extraId;

  ExtraModel({required this.extraId});

  Map<String, dynamic> toJson() {
    return {'extra_id': extraId};
  }
}
