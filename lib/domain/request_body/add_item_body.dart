class AddItemBody{
  String _itemId;
  String _qt;
  String _storeId;
  String? _extraId;


  AddItemBody({required itemId,required qt,required storeId, extraId}):
    _itemId=itemId,
    _qt=qt,
    _storeId=storeId,
    _extraId=extraId;


  String get itemId => _itemId;
  String get qt => _qt;
  String get storeId => _storeId;
  String? get extraId => _extraId;

  Map<String, dynamic> toJson() {
    if(_extraId!=null){
      return {
        "item_id": _itemId,
        "qty": _qt,
        "store_id": _storeId,
        "extra_id": _extraId,
      };
    }
    else{
      return {
        "item_id": _itemId,
        "qty": _qt,
        "store_id": _storeId,
      };
    }

  }
  setData({required itemId,required qt,required storeId, extraId}){
    _itemId = itemId;
    _qt = qt;
    _storeId = storeId;
    _extraId = extraId;
  }


}
