class SubCategoriesModel {
  bool? status;
  List<SubCategoryItem>? data;

  SubCategoriesModel({this.status, this.data});

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SubCategoryItem>[];
      json['data'].forEach((v) {
        data!.add(new SubCategoryItem.fromJson(v));
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

class SubCategoryItem {
  int? id;
  String? name;
  String? description;
  int? products;

  SubCategoryItem({this.id, this.name, this.description, this.products});

  SubCategoryItem.fromJson(Map<String, dynamic> json) {
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
