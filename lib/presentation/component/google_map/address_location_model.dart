class AddressLocationModel{
   int? id;
   String? country;
   String? city;
   String? locality;
   String? street;
   String? bigCity;
   String? lat;
   String? long;

  AddressLocationModel(
      {this.country,
      this.city,
      this.id,
      this.locality,
      this.street,
      this.bigCity,
      this.lat,
      this.long});
}