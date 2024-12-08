import 'dart:ffi';

class HomeModel {
  bool? status;
  Data? data;

  HomeModel({this.status, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Addresses>? addresses;
  List<Banners>? banners;
  List<String>? brands;
  List<Category>? categories;
  Products? products;
  Offers? offers;
  Products? featured;
  Profile? profile;
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
  String? androidStoreLink;
  String? appleStoreLink;
  String? footer;

  Data(
      {this.addresses,
        this.banners,
        this.brands,
        this.categories,
        this.products,
        this.offers,
        this.featured,
        this.profile,
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
        this.androidStoreLink,
        this.appleStoreLink,
        this.footer});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <String>[];
      json['brands'].forEach((v) {
       //brands!.add(new Null.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(new Category.fromJson(v));
      });
    }
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    offers =
    json['offers'] != null ? new Offers.fromJson(json['offers']) : null;
    featured = json['featured'] != null
        ? new Products.fromJson(json['featured'])
        : null;
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
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
    androidStoreLink = json['android_store_link'];
    appleStoreLink = json['apple_store_link'];
    footer = json['footer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
     // data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    if (this.offers != null) {
      data['offers'] = this.offers!.toJson();
    }
    if (this.featured != null) {
      data['featured'] = this.featured!.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
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
    data['android_store_link'] = this.androidStoreLink;
    data['apple_store_link'] = this.appleStoreLink;
    data['footer'] = this.footer;
    return data;
  }
}

class Addresses {
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
  Double? lat;
  Double? lng;

  Addresses(
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

  Addresses.fromJson(Map<String, dynamic> json) {
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

class Banners {
  int? id;
  String? title;
  Category? category;
  String? image;
  String? description;
  String? subTitle;

  Banners(
      {this.id,
        this.title,
        this.category,
        this.image,
        this.description,
        this.subTitle});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    image = json['image'];
    description = json['description'];
    subTitle = json['sub_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['image'] = this.image;
    data['description'] = this.description;
    data['sub_title'] = this.subTitle;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? description;
  int? products;
  List<SubCategories>? subCategories;

  Category(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.products,
        this.subCategories});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    products = json['products'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['products'] = this.products;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  String? description;
  Null? products;

  SubCategories({this.id, this.name, this.description, this.products});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['products'] = this.products;
    return data;
  }
}

class Products {
  List<Items>? items;
  Paginate? paginate;
  Null? extra;

  Products({this.items, this.paginate, this.extra});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    paginate = json['paginate'] != null
        ? new Paginate.fromJson(json['paginate'])
        : null;
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.paginate != null) {
      data['paginate'] = this.paginate!.toJson();
    }
    data['extra'] = this.extra;
    return data;
  }
}

class Items {
  int? id;
  String? name;
  String? image;
  String? statusKey;
  String? status;
  bool? isAvailable;
  String? rate;
  bool? offer;
  int? priceWithoutDiscount;
  int? price;
  int? priceAfterDiscount;
  int? priceDiscount;
  String? currency;
  bool? isFavoured;
  int? productQuantity;

  Items(
      {this.id,
        this.name,
        this.image,
        this.statusKey,
        this.status,
        this.isAvailable,
        this.rate,
        this.offer,
        this.priceWithoutDiscount,
        this.price,
        this.priceAfterDiscount,
        this.priceDiscount,
        this.currency,
        this.isFavoured,
        this.productQuantity});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    statusKey = json['status_key'];
    status = json['status'];
    isAvailable = json['is_available'];
    rate = json['rate'];
    offer = json['offer'];
    priceWithoutDiscount = json['price_without_discount'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    priceDiscount = json['price_discount'];
    currency = json['currency'];
    isFavoured = json['is_favoured'];
    productQuantity = json['product_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status_key'] = this.statusKey;
    data['status'] = this.status;
    data['is_available'] = this.isAvailable;
    data['rate'] = this.rate;
    data['offer'] = this.offer;
    data['price_without_discount'] = this.priceWithoutDiscount;
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['price_discount'] = this.priceDiscount;
    data['currency'] = this.currency;
    data['is_favoured'] = this.isFavoured;
    data['product_quantity'] = this.productQuantity;
    return data;
  }
}

class Paginate {
  int? total;
  int? count;
  int? perPage;
  String? nextPageUrl;
  String? prevPageUrl;
  int? currentPage;
  int? totalPages;

  Paginate(
      {this.total,
        this.count,
        this.perPage,
        this.nextPageUrl,
        this.prevPageUrl,
        this.currentPage,
        this.totalPages});

  Paginate.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['next_page_url'] = this.nextPageUrl;
    data['prev_page_url'] = this.prevPageUrl;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class Offers {
  List<Null>? items;
  Paginate? paginate;
  Null? extra;

  Offers({this.items, this.paginate, this.extra});

  Offers.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Null>[];
      json['items'].forEach((v) {
    //    items!.add(new Null.fromJson(v));
      });
    }
    paginate = json['paginate'] != null
        ? new Paginate.fromJson(json['paginate'])
        : null;
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
   //   data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.paginate != null) {
      data['paginate'] = this.paginate!.toJson();
    }
    data['extra'] = this.extra;
    return data;
  }
}

class Profile {
  int? id;
  String? name;
  String? userType;
  String? phone;
  String? phonecode;
  String? gender;
  String? avatar;
  int? point;
  int? valPoint;
  int? isActive;
  int? isVerified;
  int? notificationCount;
  String? email;
  int? wallet;
  Null? googleId;
  Null? branchId;
  String? tax;
  int? notifications;

  Profile(
      {this.id,
        this.name,
        this.userType,
        this.phone,
        this.phonecode,
        this.gender,
        this.avatar,
        this.point,
        this.valPoint,
        this.isActive,
        this.isVerified,
        this.notificationCount,
        this.email,
        this.wallet,
        this.googleId,
        this.branchId,
        this.tax,
        this.notifications});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userType = json['user_type'];
    phone = json['phone'];
    phonecode = json['phonecode'];
    gender = json['gender'];
    avatar = json['avatar'];
    point = json['point'];
    valPoint = json['val_point'];
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    notificationCount = json['notification_count'];
    email = json['email'];
    wallet = json['wallet'];
    googleId = json['google_id'];
    branchId = json['branch_id'];
    tax = json['tax'];
    notifications = json['notifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_type'] = this.userType;
    data['phone'] = this.phone;
    data['phonecode'] = this.phonecode;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['point'] = this.point;
    data['val_point'] = this.valPoint;
    data['is_active'] = this.isActive;
    data['is_verified'] = this.isVerified;
    data['notification_count'] = this.notificationCount;
    data['email'] = this.email;
    data['wallet'] = this.wallet;
    data['google_id'] = this.googleId;
    data['branch_id'] = this.branchId;
    data['tax'] = this.tax;
    data['notifications'] = this.notifications;
    return data;
  }
}
