
class CheckOutBody {
  final String _paymentMethod;
  final String _address;
  final String _latitude;
  final String _longitude;
  final String? _note;
  final String? _phone;
  String get paymentMethod=>_paymentMethod;
  String get address=>_address;
  String get latitude=>_latitude;
  String get longitude=>_longitude;
  String? get note=>_note;
  String? get phone=>_phone;
  CheckOutBody({required paymentMethod,required address,required latitude,
    required longitude , note,required phone,
  }) :
      _paymentMethod=paymentMethod,
      _address=address,
      _latitude=latitude,
      _longitude=longitude,
      _note=note,
      _phone=phone;

  Map<String, dynamic> toJson() {
    if(_note!=null){
      return {
        "payment_method": _paymentMethod,
        "address": _address,
        "lat": _latitude,
        "lng": _longitude,
        "note": _note,
        "phone": _phone,
      };
    }else{
      return {
        "payment_method": _paymentMethod,
        "address": _address,
        "lat": _latitude,
        "lng": _longitude,
        "phone": _phone,
      };
    }
  }
}
