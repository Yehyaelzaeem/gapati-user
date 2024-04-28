class UpdateItemBody{
  String _itemId;
  String _qt;
  String _storeId;
  String _itemCartId;
  List<String>? _extraId;


  UpdateItemBody({required itemId,required qt,required storeId, extraId,required itemCartId}):
    _itemId=itemId,
    _qt=qt,
    _storeId=storeId,
    _itemCartId=itemCartId,
    _extraId=extraId;


  String get itemId => _itemId;
  String get qt => _qt;
  String get storeId => _storeId;
  String get itemCartId => _itemCartId;
  List<String>? get extraId => _extraId;

  Map<String, dynamic> toJson() {
    if(_extraId!=null&&_extraId!.isNotEmpty){
      return {
        "item_id": _itemId,
        "qty": _qt,
        "store_id": _storeId,
        "item_cart_id": _itemCartId,
        "extra_id[]": _extraId,
      };
    }
    else{
      return {
        "item_id": _itemId,
        "qty": _qt,
        "item_cart_id": _itemCartId,
        "store_id": _storeId,
      };
    }

  }
  setData({required itemId,required qt,required storeId, extraId,required itemCartId}){
    _itemId = itemId;
    _qt = qt;
    _storeId = storeId;
    _itemCartId = itemCartId;
    _extraId = extraId;
  }


}
