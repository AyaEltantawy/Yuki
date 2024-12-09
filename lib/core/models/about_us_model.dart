class AboutUsModel {
  Section1? section1;
  List<Section2>? section2;
  List<Section3>? section3;
  List<Section4>? section4;
  Section5? section5;

  AboutUsModel(
      {this.section1,
      this.section2,
      this.section3,
      this.section4,
      this.section5});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    section1 = json['section_1'] != null
        ? new Section1.fromJson(json['section_1'])
        : null;
    if (json['section_2'] != null) {
      section2 = <Section2>[];
      json['section_2'].forEach((v) {
        section2!.add(new Section2.fromJson(v));
      });
    }
    if (json['section_3'] != null) {
      section3 = <Section3>[];
      json['section_3'].forEach((v) {
        section3!.add(new Section3.fromJson(v));
      });
    }
    if (json['section_4'] != null) {
      section4 = <Section4>[];
      json['section_4'].forEach((v) {
        section4!.add(new Section4.fromJson(v));
      });
    }
    section5 = json['section_5'] != null
        ? new Section5.fromJson(json['section_5'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.section1 != null) {
      data['section_1'] = this.section1!.toJson();
    }
    if (this.section2 != null) {
      data['section_2'] = this.section2!.map((v) => v.toJson()).toList();
    }
    if (this.section3 != null) {
      data['section_3'] = this.section3!.map((v) => v.toJson()).toList();
    }
    if (this.section4 != null) {
      data['section_4'] = this.section4!.map((v) => v.toJson()).toList();
    }
    if (this.section5 != null) {
      data['section_5'] = this.section5!.toJson();
    }
    return data;
  }
}

class Section1 {
  int? id;
  String? title;
  String? description;
  String? image;
  String? titleColored;
  String? subTitle;
  int? isActive;

  Section1(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.titleColored,
      this.subTitle,
      this.isActive});

  Section1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    titleColored = json['title_colored'];
    subTitle = json['sub_title'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['title_colored'] = this.titleColored;
    data['sub_title'] = this.subTitle;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Section2 {
  int? id;
  String? title;
  String? description;
  String? image;
  int? isActive;

  Section2({this.id, this.title, this.description, this.image, this.isActive});

  Section2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Section3 {
  int? id;
  String? title;
  String? description;
  String? image;
  int? isActive;

  Section3({this.id, this.title, this.description, this.image, this.isActive});

  Section3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Section4 {
  int? id;
  String? image;
  int? isActive;

  Section4({this.id, this.image, this.isActive});

  Section4.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Section5 {
  int? id;
  String? title;
  String? description;
  int? isActive;

  Section5({this.id, this.title, this.description, this.isActive});

  Section5.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['is_active'] = this.isActive;
    return data;
  }
}
