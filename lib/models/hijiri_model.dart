class HijiriModel {
  final int? code;
  final String? status;
  final HijiriData? data;

  HijiriModel({
    this.code,
    this.status,
    this.data,
  });

  HijiriModel.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      status = json['status'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? HijiriData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'status' : status,
    'data' : data?.toJson()
  };
}

class HijiriData {
  final Hijri? hijri;
  final Gregorian? gregorian;

  HijiriData({
    this.hijri,
    this.gregorian,
  });

  HijiriData.fromJson(Map<String, dynamic> json)
    : hijri = (json['hijri'] as Map<String,dynamic>?) != null ? Hijri.fromJson(json['hijri'] as Map<String,dynamic>) : null,
      gregorian = (json['gregorian'] as Map<String,dynamic>?) != null ? Gregorian.fromJson(json['gregorian'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'hijri' : hijri?.toJson(),
    'gregorian' : gregorian?.toJson()
  };
}

class Hijri {
  final String? date;
  final String? format;
  final String? day;
  final Weekday? weekday;
  final Month? month;
  final String? year;
  final Designation? designation;
  final List<dynamic>? holidays;

  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
  });

  Hijri.fromJson(Map<String, dynamic> json)
    : date = json['date'] as String?,
      format = json['format'] as String?,
      day = json['day'] as String?,
      weekday = (json['weekday'] as Map<String,dynamic>?) != null ? Weekday.fromJson(json['weekday'] as Map<String,dynamic>) : null,
      month = (json['month'] as Map<String,dynamic>?) != null ? Month.fromJson(json['month'] as Map<String,dynamic>) : null,
      year = json['year'] as String?,
      designation = (json['designation'] as Map<String,dynamic>?) != null ? Designation.fromJson(json['designation'] as Map<String,dynamic>) : null,
      holidays = json['holidays'] as List?;

  Map<String, dynamic> toJson() => {
    'date' : date,
    'format' : format,
    'day' : day,
    'weekday' : weekday?.toJson(),
    'month' : month?.toJson(),
    'year' : year,
    'designation' : designation?.toJson(),
    'holidays' : holidays
  };
}

class Weekday {
  final String? en;
  final String? ar;

  Weekday({
    this.en,
    this.ar,
  });

  Weekday.fromJson(Map<String, dynamic> json)
    : en = json['en'] as String?,
      ar = json['ar'] as String?;

  Map<String, dynamic> toJson() => {
    'en' : en,
    'ar' : ar
  };
}

class Month {
  final int? number;
  final String? en;
  final String? ar;

  Month({
    this.number,
    this.en,
    this.ar,
  });

  Month.fromJson(Map<String, dynamic> json)
    : number = json['number'] as int?,
      en = json['en'] as String?,
      ar = json['ar'] as String?;

  Map<String, dynamic> toJson() => {
    'number' : number,
    'en' : en,
    'ar' : ar
  };
}

class Designation {
  final String? abbreviated;
  final String? expanded;

  Designation({
    this.abbreviated,
    this.expanded,
  });

  Designation.fromJson(Map<String, dynamic> json)
    : abbreviated = json['abbreviated'] as String?,
      expanded = json['expanded'] as String?;

  Map<String, dynamic> toJson() => {
    'abbreviated' : abbreviated,
    'expanded' : expanded
  };
}

class Gregorian {
  final String? date;
  final String? format;
  final String? day;
  final GregorianWeekday? weekday;
  final GregorianMonth? month;
  final String? year;
  final GregorianDesignation? designation;

  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  Gregorian.fromJson(Map<String, dynamic> json)
    : date = json['date'] as String?,
      format = json['format'] as String?,
      day = json['day'] as String?,
      weekday = (json['weekday'] as Map<String,dynamic>?) != null ? GregorianWeekday.fromJson(json['weekday'] as Map<String,dynamic>) : null,
      month = (json['month'] as Map<String,dynamic>?) != null ? GregorianMonth.fromJson(json['month'] as Map<String,dynamic>) : null,
      year = json['year'] as String?,
      designation = (json['designation'] as Map<String,dynamic>?) != null ? GregorianDesignation.fromJson(json['designation'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'date' : date,
    'format' : format,
    'day' : day,
    'weekday' : weekday?.toJson(),
    'month' : month?.toJson(),
    'year' : year,
    'designation' : designation?.toJson()
  };
}

class GregorianWeekday {
  final String? en;

  GregorianWeekday({
    this.en,
  });

  GregorianWeekday.fromJson(Map<String, dynamic> json)
    : en = json['en'] as String?;

  Map<String, dynamic> toJson() => {
    'en' : en
  };
}

class GregorianMonth {
  final int? number;
  final String? en;

  GregorianMonth({
    this.number,
    this.en,
  });

  GregorianMonth.fromJson(Map<String, dynamic> json)
    : number = json['number'] as int?,
      en = json['en'] as String?;

  Map<String, dynamic> toJson() => {
    'number' : number,
    'en' : en
  };
}

class GregorianDesignation {
  final String? abbreviated;
  final String? expanded;

  GregorianDesignation({
    this.abbreviated,
    this.expanded,
  });

  GregorianDesignation.fromJson(Map<String, dynamic> json)
    : abbreviated = json['abbreviated'] as String?,
      expanded = json['expanded'] as String?;

  Map<String, dynamic> toJson() => {
    'abbreviated' : abbreviated,
    'expanded' : expanded
  };
}