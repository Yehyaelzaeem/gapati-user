
class CheckOutBody {
  final String _paymentMethod;
  final String _address;
  final String _latitude;
  final String _longitude;
  final String? _note;
  String get paymentMethod=>_paymentMethod;
  String get address=>_address;
  String get latitude=>_latitude;
  String get longitude=>_longitude;
  String? get note=>_note;
  CheckOutBody({required paymentMethod,required address,required latitude,
    required longitude , note
  }) :
      _paymentMethod=paymentMethod,
      _address=address,
      _latitude=latitude,
      _longitude=longitude,
      _note=note;

  Map<String, dynamic> toJson() {
    if(_note!=null){
      return {
        "payment_method": _paymentMethod,
        "address": _address,
        "lat": _latitude,
        "lng": _longitude,
        "note": _note,
      };
    }else{
      return {
        "payment_method": _paymentMethod,
        "address": _address,
        "lat": _latitude,
        "lng": _longitude,
      };
    }
  }
}
