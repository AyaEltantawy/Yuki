class ContactUsResponse {
  bool? status;
  Data? data;

  ContactUsResponse({this.status, this.data});

  ContactUsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? logoDark;
  String? logoWhite;
  String? facebook;
  String? whatsapp;
  String? instegram;
  String? twitter;
  String? linkedIn;
  String? website;
  String? tikTok;
  String? youTube;
  String? email;
  List<String>? address;
  List<String>? numbers;
  String? appleStoreLink;
  String? androidStoreLink;

  Data(
      {this.logoDark,
        this.logoWhite,
        this.facebook,
        this.whatsapp,
        this.instegram,
        this.twitter,
        this.linkedIn,
        this.website,
        this.tikTok,
        this.youTube,
        this.email,
        this.address,
        this.numbers,
        this.appleStoreLink,
        this.androidStoreLink});

  Data.fromJson(Map<String, dynamic> json) {
    logoDark = json['logo_dark'];
    logoWhite = json['logo_white'];
    facebook = json['facebook'];
    whatsapp = json['Whatsapp'];
    instegram = json['instegram'];
    twitter = json['twitter'];
    linkedIn = json['LinkedIn'];
    website = json['website'];
    tikTok = json['TikTok'];
    youTube = json['YouTube'];
    email = json['email'];
    address = json['address'].cast<String>();
    numbers = json['numbers'].cast<String>();
    appleStoreLink = json['apple_store_link'];
    androidStoreLink = json['android_store_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo_dark'] = this.logoDark;
    data['logo_white'] = this.logoWhite;
    data['facebook'] = this.facebook;
    data['Whatsapp'] = this.whatsapp;
    data['instegram'] = this.instegram;
    data['twitter'] = this.twitter;
    data['LinkedIn'] = this.linkedIn;
    data['website'] = this.website;
    data['TikTok'] = this.tikTok;
    data['YouTube'] = this.youTube;
    data['email'] = this.email;
    data['address'] = this.address;
    data['numbers'] = this.numbers;
    data['apple_store_link'] = this.appleStoreLink;
    data['android_store_link'] = this.androidStoreLink;
    return data;
  }
}
