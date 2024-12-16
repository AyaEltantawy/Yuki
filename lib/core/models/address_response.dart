class AddressResponse {
  bool? status;
  List<Data>? data;

  AddressResponse({this.status, this.data});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? postal;
  int? isDefault;
  String? nearestPlace;
  String? address;
  String? kind;
  String? kindKey;
  String? country;
  int? countryId;
  String? city;
  int? cityId;
  List<ShippingFees>? shippingFees;
  Null? lat;
  Null? lng;

  Data(
      {this.id,
        this.name,
        this.postal,
        this.isDefault,
        this.nearestPlace,
        this.address,
        this.kind,
        this.kindKey,
        this.country,
        this.countryId,
        this.city,
        this.cityId,
        this.shippingFees,
        this.lat,
        this.lng});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    postal = json['postal'];
    isDefault = json['is_default'];
    nearestPlace = json['nearest_place'];
    address = json['address'];
    kind = json['kind'];
    kindKey = json['kind_key'];
    country = json['country'];
    countryId = json['country_id'];
    city = json['city'];
    cityId = json['city_id'];
    if (json['shipping_fees'] != null) {
      shippingFees = <ShippingFees>[];
      json['shipping_fees'].forEach((v) {
        shippingFees!.add(new ShippingFees.fromJson(v));
      });
    }
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['postal'] = this.postal;
    data['is_default'] = this.isDefault;
    data['nearest_place'] = this.nearestPlace;
    data['address'] = this.address;
    data['kind'] = this.kind;
    data['kind_key'] = this.kindKey;
    data['country'] = this.country;
    data['country_id'] = this.countryId;
    data['city'] = this.city;
    data['city_id'] = this.cityId;
    if (this.shippingFees != null) {
      data['shipping_fees'] =
          this.shippingFees!.map((v) => v.toJson()).toList();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class ShippingFees {
  int? id;
  int? from;
  Null? to;
  int? value;

  ShippingFees({this.id, this.from, this.to, this.value});

  ShippingFees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from'] = this.from;
    data['to'] = this.to;
    data['value'] = this.value;
    return data;
  }
}
