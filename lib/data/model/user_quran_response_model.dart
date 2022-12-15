class UserQuranResponseModel {
  bool? success;
  int? code;
  String? message;
  Quran? data;

  UserQuranResponseModel({this.success, this.code, this.message, this.data});

  UserQuranResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Quran.fromJson(json['data']) : null;
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

class Quran {
  List<Surah>? surah;
  List<Juz>? juz;

  Quran({this.surah, this.juz});

  Quran.fromJson(Map<String, dynamic> json) {
    if (json['surah'] != null) {
      surah = <Surah>[];
      json['surah'].forEach((v) {
        surah!.add(Surah.fromJson(v));
      });
    }
    if (json['juz'] != null) {
      juz = <Juz>[];
      json['juz'].forEach((v) {
        juz!.add(Juz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (surah != null) {
      data['surah'] = surah!.map((v) => v.toJson()).toList();
    }
    if (juz != null) {
      data['juz'] = juz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Surah {
  int? number;
  String? name;
  String? englishName;
  int? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationPlace;

  Surah(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelationPlace});

  Surah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationPlace = json['revelation_place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['englishName'] = englishName;
    data['englishNameTranslation'] = englishNameTranslation;
    data['numberOfAyahs'] = numberOfAyahs;
    data['revelation_place'] = revelationPlace;
    return data;
  }
}

class Juz {
  int? number;
  String? englishName;
  String? name;
  String? englishNameTranslation;
  dynamic numberOfAyahs;
  dynamic revelationType;
  String? createdAt;
  dynamic updatedAt;

  Juz(
      {this.number,
      this.englishName,
      this.name,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelationType,
      this.createdAt,
      this.updatedAt});

  Juz.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    englishName = json['englishName'];
    name = json['name'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['englishName'] = englishName;
    data['name'] = name;
    data['englishNameTranslation'] = englishNameTranslation;
    data['numberOfAyahs'] = numberOfAyahs;
    data['revelationType'] = revelationType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class QuranResponseDetails {
  bool? success;
  int? code;
  String? message;
  QuranDetails? data;

  QuranResponseDetails({this.success, this.code, this.message, this.data});

  QuranResponseDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? QuranDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class QuranDetails {
  String? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  String? numberOfAyahs;
  List<Ayahs>? ayahs;

  QuranDetails(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.numberOfAyahs,
      this.ayahs});

  QuranDetails.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(Ayahs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['englishNameTranslation'] = this.englishNameTranslation;
    data['revelationType'] = this.revelationType;
    data['numberOfAyahs'] = this.numberOfAyahs;
    if (this.ayahs != null) {
      data['ayahs'] = this.ayahs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ayahs {
  String? number;
  String? text;
  String? numberInSurah;
  String? juz;
  String? manzil;
  String? page;
  String? ruku;
  String? hizbQuarter;
  String? sajda;

  Ayahs(
      {this.number,
      this.text,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['text'] = this.text;
    data['numberInSurah'] = this.numberInSurah;
    data['juz'] = this.juz;
    data['manzil'] = this.manzil;
    data['page'] = this.page;
    data['ruku'] = this.ruku;
    data['hizbQuarter'] = this.hizbQuarter;
    data['sajda'] = this.sajda;
    return data;
  }
}
