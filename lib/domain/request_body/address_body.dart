
class AddressBody {
  final String _addressNote;
  final String _phone;
  final String _address;
  final String _latitude;
  final  String _longitude;

  String get addressType => _addressNote;
  String get phone => _phone;
  String get address => _address;
  String get latitude => _latitude;
  String get longitude => _longitude;

  AddressBody(
      {
        required addressNote,
        required  address,
        required latitude,
        required longitude,
        required phone,
  }):
       _addressNote= addressNote,
        _address=address,
       _latitude= latitude,
       _longitude= longitude,
       _phone= phone;

  Map<String, dynamic> toJson() {
    return {
      "address_not": _addressNote,
      "address": _address,
      "lat": _latitude,
      "lng": _longitude,
      "phone": _phone,
    };
  }
}
