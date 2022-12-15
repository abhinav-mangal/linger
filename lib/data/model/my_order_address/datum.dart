import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int? id;
  final int? uid;
  final String? name;
  final String? mobileNumber;
  final String? country;
  final String? postcode;
  final String? address;
  final String? state;
  final String? city;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Address({
    this.id,
    this.uid,
    this.name,
    this.mobileNumber,
    this.country,
    this.postcode,
    this.address,
    this.state,
    this.city,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json['id'] as int?,
        uid: json['uid'] as int?,
        name: json['name'] as String?,
        mobileNumber: json['mobile_number'] as String?,
        country: json['country'] as String?,
        postcode: json['postcode'] as String?,
        address: json['address'] as String?,
        state: json['state'] as String?,
        city: json['city'] as String?,
        status: json['status'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'name': name,
        'mobile_number': mobileNumber,
        'country': country,
        'postcode': postcode,
        'address': address,
        'state': state,
        'city': city,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  Address copyWith({
    int? id,
    int? uid,
    String? name,
    String? mobileNumber,
    String? country,
    String? postcode,
    String? address,
    String? state,
    String? city,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      country: country ?? this.country,
      postcode: postcode ?? this.postcode,
      address: address ?? this.address,
      state: state ?? this.state,
      city: city ?? this.city,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      uid,
      name,
      mobileNumber,
      country,
      postcode,
      address,
      state,
      city,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
