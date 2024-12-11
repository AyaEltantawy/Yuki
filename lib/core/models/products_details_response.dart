class ProductDetailsResponse {
  bool? status;
  Data? data;

  ProductDetailsResponse({this.status, this.data});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  Product? product;
  SimilarProducts? similarProducts;

  Data({this.product, this.similarProducts});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    similarProducts = json['similar_products'] != null
        ? new SimilarProducts.fromJson(json['similar_products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.similarProducts != null) {
      data['similar_products'] = this.similarProducts!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? image;
  String? rate;
  String? statusKey;
  String? status;
  bool? isAvailable;
  bool? offer;
  Category? category;
  String? brand;
  int? priceWithoutDiscount;
  int? price;
  int? priceAfterDiscount;
  int? priceDiscount;
  String? currency;
  String? description;
  String? components;
  String? howUse;
  bool? isFavoured;
  List<String>? images;
  List<Rates>? rates;
  int? productQuantity;

  Product(
      {this.id,
      this.name,
      this.image,
      this.rate,
      this.statusKey,
      this.status,
      this.isAvailable,
      this.offer,
      this.category,
      this.brand,
      this.priceWithoutDiscount,
      this.price,
      this.priceAfterDiscount,
      this.priceDiscount,
      this.currency,
      this.description,
      this.components,
      this.howUse,
      this.isFavoured,
      this.images,
      this.rates,
      this.productQuantity});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    rate = json['rate'];
    statusKey = json['status_key'];
    status = json['status'];
    isAvailable = json['is_available'];
    offer = json['offer'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'];
    priceWithoutDiscount = json['price_without_discount'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    priceDiscount = json['price_discount'];
    currency = json['currency'];
    description = json['description'];
    components = json['components'];
    howUse = json['how_use'];
    isFavoured = json['is_favoured'];
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        //images!.add(new Null.fromJson(v));
      });
    }
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) {
        rates!.add(new Rates.fromJson(v));
      });
    }
    productQuantity = json['product_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['rate'] = this.rate;
    data['status_key'] = this.statusKey;
    data['status'] = this.status;
    data['is_available'] = this.isAvailable;
    data['offer'] = this.offer;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['brand'] = this.brand;
    data['price_without_discount'] = this.priceWithoutDiscount;
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['price_discount'] = this.priceDiscount;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['components'] = this.components;
    data['how_use'] = this.howUse;
    data['is_favoured'] = this.isFavoured;
    if (this.images != null) {
      // data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.rates != null) {
      data['rates'] = this.rates!.map((v) => v.toJson()).toList();
    }
    data['product_quantity'] = this.productQuantity;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? description;
  int? products;
  List<Category>? subCategories;

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
      subCategories = <Category>[];
      json['sub_categories'].forEach((v) {
        // subCategories!.add(new Null.fromJson(v));
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

class Rates {
  int? id;
  String? message;
  int? value;
  String? createdAt;
  String? name;
  String? logo;

  Rates(
      {this.id,
      this.message,
      this.value,
      this.createdAt,
      this.name,
      this.logo});

  Rates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    value = json['value'];
    createdAt = json['created_at'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class SimilarProducts {
  List<Items>? items;
  Paginate? paginate;
  Null? extra;

  SimilarProducts({this.items, this.paginate, this.extra});

  SimilarProducts.fromJson(Map<String, dynamic> json) {
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
