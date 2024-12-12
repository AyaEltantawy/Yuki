class ProductsModel {
  bool? status;
  Data? data;
  Extra? extra;

  ProductsModel({this.status, this.data, this.extra});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.extra != null) {
      data['extra'] = this.extra!.toJson();
    }
    return data;
  }
}

class Data {
  List<Items>? items;
  Paginate? paginate;
  Null? extra;

  Data({this.items, this.paginate, this.extra});

  Data.fromJson(Map<String, dynamic> json) {
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

class Extra {
  int? maxProduct;

  Extra({this.maxProduct});

  Extra.fromJson(Map<String, dynamic> json) {
    maxProduct = json['maxProduct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxProduct'] = this.maxProduct;
    return data;
  }
}
