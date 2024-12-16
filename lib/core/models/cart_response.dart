class CartResponse {
  bool? status;
  String? message;
  Data? data;

  CartResponse({this.status, this.message, this.data});

  CartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Order? order;
  int? wallet;
  String? tax;

  Data({
    this.order,
    this.wallet,
    this.tax,
  });

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    wallet = json['wallet'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['wallet'] = this.wallet;
    data['tax'] = this.tax;

    return data;
  }
}

class Order {
  int? id;
  Null? address;
  int? subTotal;
  String? sourceKey;
  String? source;
  int? discount;
  int? couponValue;
  String? coupon;
  int? grandTotal;
  int? cashback;
  bool? dayReturns;
  bool? canRateOrder;
  bool? canReturnOrder;
  bool? canAcceptOrder;
  bool? canCancelOrder;
  int? shippingFees;
  Null? shippingMethod;
  String? pointDiscount;
  Null? paymentMethod;
  String? company;
  String? companyId;
  String? representative;
  String? representativeId;
  String? saleRepresentativeId;
  String? saleRepresentative;
  String? statusKey;
  String? status;
  String? createdAt;
  String? itemsCount;
  bool? rateExists;
  int? productsCount;
  int? onePaice;
  int? tax;
  String? currency;
  List<Items>? items;
  List<Null>? deposits;
  List<Null>? reminders;
  String? whatsapp;
  String? name;
  String? phone;
  Null? branch;
  Null? branchId;
  int? actualShippingFees;
  Null? orderGiftNote;
  String? orderType;
  String? dateCanceled;
  User? user;
  int? grandTotalAfterDeposit;
  int? deposit;
  List<String>? images;

  Order(
      {this.id,
      this.address,
      this.subTotal,
      this.sourceKey,
      this.source,
      this.discount,
      this.couponValue,
      this.coupon,
      this.grandTotal,
      this.cashback,
      this.dayReturns,
      this.canRateOrder,
      this.canReturnOrder,
      this.canAcceptOrder,
      this.canCancelOrder,
      this.shippingFees,
      this.shippingMethod,
      this.pointDiscount,
      this.paymentMethod,
      this.company,
      this.companyId,
      this.representative,
      this.representativeId,
      this.saleRepresentativeId,
      this.saleRepresentative,
      this.statusKey,
      this.status,
      this.createdAt,
      this.itemsCount,
      this.rateExists,
      this.productsCount,
      this.onePaice,
      this.tax,
      this.currency,
      this.items,
      this.deposits,
      this.reminders,
      this.whatsapp,
      this.name,
      this.phone,
      this.branch,
      this.branchId,
      this.actualShippingFees,
      this.orderGiftNote,
      this.orderType,
      this.dateCanceled,
      this.user,
      this.grandTotalAfterDeposit,
      this.deposit,
      this.images});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    subTotal = json['sub_total'];
    sourceKey = json['source_key'];
    source = json['source'];
    discount = json['discount'];
    couponValue = json['coupon_value'];
    coupon = json['coupon'];
    grandTotal = json['grand_total'];
    cashback = json['cashback'];
    dayReturns = json['day_returns'];
    canRateOrder = json['can_rate_order'];
    canReturnOrder = json['can_return_order'];
    canAcceptOrder = json['can_accept_order'];
    canCancelOrder = json['can_cancel_order'];
    shippingFees = json['shipping_fees'];
    shippingMethod = json['shipping_method'];
    pointDiscount = json['point_discount'];
    paymentMethod = json['payment_method'];
    company = json['company'];
    companyId = json['company_id'];
    representative = json['representative'];
    representativeId = json['representative_id'];
    saleRepresentativeId = json['sale_representative_id'];
    saleRepresentative = json['sale_representative'];
    statusKey = json['status_key'];
    status = json['status'];
    createdAt = json['created_at'];
    itemsCount = json['items_count'];
    rateExists = json['rate_exists'];
    productsCount = json['products_count'];
    onePaice = json['one_paice'];
    tax = json['tax'];
    currency = json['currency'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    if (json['deposits'] != null) {
      deposits = <Null>[];
      json['deposits'].forEach((v) {});
    }
    if (json['reminders'] != null) {
      reminders = <Null>[];
      json['reminders'].forEach((v) {});
    }
    whatsapp = json['whatsapp'];
    name = json['name'];
    phone = json['phone'];
    branch = json['branch'];
    branchId = json['branch_id'];
    actualShippingFees = json['actual_shipping_fees'];
    orderGiftNote = json['order_gift_note'];
    orderType = json['order_type'];
    dateCanceled = json['date_canceled'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    grandTotalAfterDeposit = json['grand_total_after_deposit'];
    deposit = json['deposit'];
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        //images!.add(new String.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['sub_total'] = this.subTotal;
    data['source_key'] = this.sourceKey;
    data['source'] = this.source;
    data['discount'] = this.discount;
    data['coupon_value'] = this.couponValue;
    data['coupon'] = this.coupon;
    data['grand_total'] = this.grandTotal;
    data['cashback'] = this.cashback;
    data['day_returns'] = this.dayReturns;
    data['can_rate_order'] = this.canRateOrder;
    data['can_return_order'] = this.canReturnOrder;
    data['can_accept_order'] = this.canAcceptOrder;
    data['can_cancel_order'] = this.canCancelOrder;
    data['shipping_fees'] = this.shippingFees;
    data['shipping_method'] = this.shippingMethod;
    data['point_discount'] = this.pointDiscount;
    data['payment_method'] = this.paymentMethod;
    data['company'] = this.company;
    data['company_id'] = this.companyId;
    data['representative'] = this.representative;
    data['representative_id'] = this.representativeId;
    data['sale_representative_id'] = this.saleRepresentativeId;
    data['sale_representative'] = this.saleRepresentative;
    data['status_key'] = this.statusKey;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['items_count'] = this.itemsCount;
    data['rate_exists'] = this.rateExists;
    data['products_count'] = this.productsCount;
    data['one_paice'] = this.onePaice;
    data['tax'] = this.tax;
    data['currency'] = this.currency;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }

    data['whatsapp'] = this.whatsapp;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['branch'] = this.branch;
    data['branch_id'] = this.branchId;
    data['actual_shipping_fees'] = this.actualShippingFees;
    data['order_gift_note'] = this.orderGiftNote;
    data['order_type'] = this.orderType;
    data['date_canceled'] = this.dateCanceled;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['grand_total_after_deposit'] = this.grandTotalAfterDeposit;
    data['deposit'] = this.deposit;
    if (this.images != null) {
      // data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
  int? productQuantity;
  int? priceWithoutDiscount;
  int? price;
  int? quantity;
  int? grandTotal;
  String? currency;
  int? quantityReturn;
    List<String>? images;

  Items(
      {this.id,
      this.productId,
      this.productName,
      this.productImage,
      this.productQuantity,
      this.priceWithoutDiscount,
      this.price,
      this.quantity,
      this.grandTotal,
      this.currency,
      this.quantityReturn,
      this.images});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productQuantity = json['product_quantity'];
    priceWithoutDiscount = json['price_without_discount'];
    price = json['price'];
    quantity = json['quantity'];
    grandTotal = json['grand_total'];
    currency = json['currency'];
    quantityReturn = json['quantity_return'];
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        //  images!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['product_quantity'] = this.productQuantity;
    data['price_without_discount'] = this.priceWithoutDiscount;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['grand_total'] = this.grandTotal;
    data['currency'] = this.currency;
    data['quantity_return'] = this.quantityReturn;
    if (this.images != null) {
      //l data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? userType;
  String? gender;
  String? phone;
  String? phonecode;
  String? phoneWithCode;
  String? email;
  String? avatar;
  int? isActive;
  Null? tex;
  String? createdAt;
  List<Addresses>? addresses;

  User(
      {this.id,
      this.name,
      this.userType,
      this.gender,
      this.phone,
      this.phonecode,
      this.phoneWithCode,
      this.email,
      this.avatar,
      this.isActive,
      this.tex,
      this.createdAt,
      this.addresses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userType = json['user_type'];
    gender = json['gender'];
    phone = json['phone'];
    phonecode = json['phonecode'];
    phoneWithCode = json['phone_with_code'];
    email = json['email'];
    avatar = json['avatar'];
    isActive = json['is_active'];
    tex = json['tex'];
    createdAt = json['created_at'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_type'] = this.userType;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['phonecode'] = this.phonecode;
    data['phone_with_code'] = this.phoneWithCode;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['is_active'] = this.isActive;
    data['tex'] = this.tex;
    data['created_at'] = this.createdAt;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? id;
  Null? placeName;
  String? kind;
  Null? nearestPlace;
  String? address;
  Null? lat;
  Null? lng;
  int? isDefault;
  Country? country;
  Country? city;

  Addresses(
      {this.id,
      this.placeName,
      this.kind,
      this.nearestPlace,
      this.address,
      this.lat,
      this.lng,
      this.isDefault,
      this.country,
      this.city});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeName = json['place_name'];
    kind = json['kind'];
    nearestPlace = json['nearest_place'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    isDefault = json['is_default'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    city = json['city'] != null ? new Country.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['place_name'] = this.placeName;
    data['kind'] = this.kind;
    data['nearest_place'] = this.nearestPlace;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['is_default'] = this.isDefault;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
