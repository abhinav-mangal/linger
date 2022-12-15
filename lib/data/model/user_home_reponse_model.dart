class UserHomeResponseModel {
  bool? success;
  int? code;
  String? message;
  Data? data;

  UserHomeResponseModel({this.success, this.code, this.message, this.data});

  UserHomeResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Slider>? slider;
  List<PerOfTheDay>? perOfTheDay;
  Slider? verseOfTheDay;
  List<Timeslot>? timeslot;
  int? termsCondition;

  Data(
      {this.slider,
      this.perOfTheDay,
      this.verseOfTheDay,
      this.timeslot,
      this.termsCondition});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = [];
      json['slider'].forEach((v) {
        slider!.add(Slider.fromJson(v));
      });
    }
    if (json['per_of_the_day'] != null) {
      perOfTheDay = [];
      json['per_of_the_day'].forEach((v) {
        perOfTheDay!.add(PerOfTheDay.fromJson(v));
      });
    }
    verseOfTheDay = json['verse_of_the_day'] != null
        ? Slider.fromJson(json['verse_of_the_day'])
        : null;
    if (json['timeslot'] != null) {
      timeslot = [];
      json['timeslot'].forEach((v) {
        timeslot!.add(Timeslot.fromJson(v));
      });
    }
    termsCondition = json['terms_condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    if (perOfTheDay != null) {
      data['per_of_the_day'] = perOfTheDay!.map((v) => v.toJson()).toList();
    }
    if (verseOfTheDay != null) {
      data['verse_of_the_day'] = verseOfTheDay!.toJson();
    }
    if (timeslot != null) {
      data['timeslot'] = timeslot!.map((v) => v.toJson()).toList();
    }
    data['terms_condition'] = termsCondition;
    return data;
  }
}

class Slider {
  int? id;
  int? type;
  String? image;
  String? title;
  int? status;
  String? createdAt;
  String? updatedAt;

  Slider(
      {this.id,
      this.type,
      this.image,
      this.title,
      this.status,
      this.createdAt,
      this.updatedAt});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['image'] = image;
    data['title'] = title;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PerOfTheDay {
  int? id;
  int? userId;
  String? name;
  String? profileImage;
  int? primeStatus;
  String? image;
  bool isLike = false;
  int? totalLike;

  PerOfTheDay(
      {this.id,
      this.userId,
      this.name,
      this.profileImage,
      this.primeStatus,
      this.image,
      this.isLike = false,
      this.totalLike});

  PerOfTheDay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    profileImage = json['profile_image'];
    primeStatus = json['prime_status'];
    image = json['image'];
    isLike = json['is_like'];
    totalLike = json['total_like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['profile_image'] = profileImage;
    data['prime_status'] = primeStatus;
    data['image'] = image;
    data['is_like'] = isLike;
    data['total_like'] = totalLike;
    return data;
  }
}

class Timeslot {
  int? id;
  String? slotName;
  String? startTime;
  String? endTime;
  String? status;

  Timeslot({this.id, this.slotName, this.startTime, this.endTime, this.status});

  Timeslot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slotName = json['slot_name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slot_name'] = slotName;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['status'] = status;
    return data;
  }
}
