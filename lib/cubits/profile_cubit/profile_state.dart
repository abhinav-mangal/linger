part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.user,
    this.authCredentials,
    this.mobileNumber,
    this.personalProfileModel,
    this.myInfo,
    this.pickedProfilePic,
  });

  const ProfileState.init({
    this.user,
    this.authCredentials,
    this.mobileNumber,
    this.personalProfileModel,
    this.myInfo,
    this.pickedProfilePic,
  });

  final UserLoginResponseModel? user;
  final auth.UserCredential? authCredentials;
  final String? mobileNumber;
  final PersonalProfileModel? personalProfileModel;
  final MyInfo? myInfo;
  final File? pickedProfilePic;

  ProfileState copyWith({
    UserLoginResponseModel? user,
    auth.UserCredential? authCredentials,
    String? mobileNumber,
    PersonalProfileModel? personalProfileModel,
    MyInfo? myInfo,
    File? pickedProfilePic,
  }) {
    return ProfileState(
      user: user ?? this.user,
      authCredentials: authCredentials ?? this.authCredentials,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      personalProfileModel: personalProfileModel ?? this.personalProfileModel,
      myInfo: myInfo ?? this.myInfo,
      pickedProfilePic: pickedProfilePic ?? this.pickedProfilePic,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        user,
        authCredentials,
        mobileNumber,
        personalProfileModel,
        myInfo,
      ];
}
