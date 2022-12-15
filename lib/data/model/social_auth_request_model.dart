class SocialAuthRequestModel {
  AdditionalUserInfo? additionalUserInfo;
  SocialAuthUser? authUser;

  SocialAuthRequestModel({this.additionalUserInfo, this.authUser});

  SocialAuthRequestModel.fromJson(Map<String, dynamic> json) {
    additionalUserInfo = json['additionalUserInfo'] != null
        ? AdditionalUserInfo.fromJson(json['additionalUserInfo'])
        : null;
    authUser =
        json['user'] != null ? SocialAuthUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (additionalUserInfo != null) {
      data['additionalUserInfo'] = additionalUserInfo!.toJson();
    }
    if (authUser != null) {
      data['user'] = authUser!.toJson();
    }
    return data;
  }
}

class AdditionalUserInfo {
  dynamic username;
  String? providerId;
  bool? isNewUser;
  Profile? profile;

  AdditionalUserInfo(
      {this.username, this.providerId, this.isNewUser, this.profile});

  AdditionalUserInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    providerId = json['providerId'];
    isNewUser = json['isNewUser'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['providerId'] = providerId;
    data['isNewUser'] = isNewUser;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? atHash;
  int? exp;
  String? hd;
  String? azp;
  String? nonce;
  String? picture;
  String? locale;
  String? iss;
  bool? emailVerified;
  String? sub;
  String? aud;
  String? familyName;
  int? iat;
  String? givenName;
  String? name;
  String? email;

  Profile(
      {this.atHash,
      this.exp,
      this.hd,
      this.azp,
      this.nonce,
      this.picture,
      this.locale,
      this.iss,
      this.emailVerified,
      this.sub,
      this.aud,
      this.familyName,
      this.iat,
      this.givenName,
      this.name,
      this.email});

  Profile.fromJson(Map<String, dynamic> json) {
    atHash = json['at_hash'];
    exp = json['exp'];
    hd = json['hd'];
    azp = json['azp'];
    nonce = json['nonce'];
    picture = json['picture'];
    locale = json['locale'];
    iss = json['iss'];
    emailVerified = json['email_verified'];
    sub = json['sub'];
    aud = json['aud'];
    familyName = json['family_name'];
    iat = json['iat'];
    givenName = json['given_name'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['at_hash'] = atHash;
    data['exp'] = exp;
    data['hd'] = hd;
    data['azp'] = azp;
    data['nonce'] = nonce;
    data['picture'] = picture;
    data['locale'] = locale;
    data['iss'] = iss;
    data['email_verified'] = emailVerified;
    data['sub'] = sub;
    data['aud'] = aud;
    data['family_name'] = familyName;
    data['iat'] = iat;
    data['given_name'] = givenName;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class SocialAuthUser {
  bool? emailVerified;
  String? uid;
  String? providerId;
  List<ProviderData>? providerData;
  String? displayName;
  String? refreshToken;
  String? email;
  bool? isAnonymous;
  Metadata? metadata;
  String? photoURL;
  dynamic phoneNumber;

  SocialAuthUser(
      {this.emailVerified,
      this.uid,
      this.providerId,
      this.providerData,
      this.displayName,
      this.refreshToken,
      this.email,
      this.isAnonymous,
      this.metadata,
      this.photoURL,
      this.phoneNumber});

  SocialAuthUser.fromJson(Map<String, dynamic> json) {
    emailVerified = json['emailVerified'];
    uid = json['uid'];
    providerId = json['providerId'];
    if (json['providerData'] != null) {
      providerData = <ProviderData>[];
      json['providerData'].forEach((v) {
        providerData!.add(ProviderData.fromJson(v));
      });
    }
    displayName = json['displayName'];
    refreshToken = json['refreshToken'];
    email = json['email'];
    isAnonymous = json['isAnonymous'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    photoURL = json['photoURL'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emailVerified'] = emailVerified;
    data['uid'] = uid;
    data['providerId'] = providerId;
    if (providerData != null) {
      data['providerData'] = providerData!.map((v) => v.toJson()).toList();
    }
    data['displayName'] = displayName;
    data['refreshToken'] = refreshToken;
    data['email'] = email;
    data['isAnonymous'] = isAnonymous;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['photoURL'] = photoURL;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

class ProviderData {
  String? email;
  String? providerId;
  String? photoURL;
  String? uid;
  String? displayName;

  ProviderData(
      {this.email, this.providerId, this.photoURL, this.uid, this.displayName});

  ProviderData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    providerId = json['providerId'];
    photoURL = json['photoURL'];
    uid = json['uid'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['providerId'] = providerId;
    data['photoURL'] = photoURL;
    data['uid'] = uid;
    data['displayName'] = displayName;
    return data;
  }
}

class Metadata {
  int? creationTime;
  int? lastSignInTime;

  Metadata({this.creationTime, this.lastSignInTime});

  Metadata.fromJson(Map<String, dynamic> json) {
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['creationTime'] = creationTime;
    data['lastSignInTime'] = lastSignInTime;
    return data;
  }
}
