class WalletResponse {
  bool? success;
  int? code;
  String? message;
  WalletResponseBody? data;

  WalletResponse({this.success, this.code, this.message, this.data});

  WalletResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? WalletResponseBody.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WalletResponseBody {
  int? wallet;
  List<Null>? payment;

  WalletResponseBody({this.wallet, this.payment});

  WalletResponseBody.fromJson(Map<String, dynamic> json) {
    wallet = json['wallet'];
    if (json['payment'] != null) {
      payment = [];
      // json['payment'].forEach((v) {
      //   payment!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet'] = this.wallet;
    // if (this.payment != null) {
    //   data['payment'] = this.payment!.map((v) => v!.toJson()).toList();
    // }
    return data;
  }
}
