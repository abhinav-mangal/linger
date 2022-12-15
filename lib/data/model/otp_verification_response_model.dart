class OTPVerificationResponse {
  bool? status;
  int? statuscode;
  String? massage;
  VerificationData? data;
  String? token;

  OTPVerificationResponse(
      {this.status, this.statuscode, this.massage, this.data, this.token});

  OTPVerificationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statuscode = json['statuscode'];
    massage = json['massage'];
    data =
        json['data'] != null ? VerificationData.fromJson(json['data']) : null;
    token = json['_access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statuscode'] = statuscode;
    data['massage'] = massage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['_access_token'] = token;
    return data;
  }
}

class VerificationData {
  int? id;
  String? mobileNo;
  String? loginStatus;
  String? role;
  int? otp;
  String? createdAt;
  String? updatedAt;

  VerificationData(
      {this.id,
      this.mobileNo,
      this.loginStatus,
      this.role,
      this.otp,
      this.createdAt,
      this.updatedAt});

  VerificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNo = json['mobile_no'];
    loginStatus = json['login_status'];
    role = json['role'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mobile_no'] = mobileNo;
    data['login_status'] = loginStatus;
    data['role'] = role;
    data['otp'] = otp;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
