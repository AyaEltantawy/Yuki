class PolicyModel {
  bool? status;
  Data? data;

  PolicyModel({this.status, this.data});

  PolicyModel.fromJson(Map<String, dynamic> json) {
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
  String? refundPolicy;
  String? privacyPolicy;
  String? shippingPolicy;
  String? termsOfService;

  Data(
      {this.refundPolicy,
      this.privacyPolicy,
      this.shippingPolicy,
      this.termsOfService});

  Data.fromJson(Map<String, dynamic> json) {
    refundPolicy = json['refund_policy'];
    privacyPolicy = json['privacy_policy'];
    shippingPolicy = json['shipping_Policy'];
    termsOfService = json['Terms_of_Service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refund_policy'] = this.refundPolicy;
    data['privacy_policy'] = this.privacyPolicy;
    data['shipping_Policy'] = this.shippingPolicy;
    data['Terms_of_Service'] = this.termsOfService;
    return data;
  }
}
