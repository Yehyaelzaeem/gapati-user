
class AddressBody {
  final String _addressType;
  final String _address;
  final String _latitude;
  final  String _longitude;

  String get addressType => _addressType;
  String get address => _address;
  String get latitude => _latitude;
  String get longitude => _longitude;

  AddressBody(
      {
        required addressType,
        required  address,
        required latitude,
        required longitude,
  }):
       _addressType= addressType,
        _address=address,
       _latitude= latitude,
       _longitude= longitude;

  Map<String, dynamic> toJson() {
    return {
      "address_type": _addressType,
      "address_to": _address,
      "lat_to": _latitude,
      "lng_to": _longitude,
    };
  }
}
