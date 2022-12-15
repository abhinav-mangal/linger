part of 'signup_controller_cubit.dart';

class SignUpState extends Equatable {
  final String? fname;
  final String? lname;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool obSecurePassword;
  final File? pickedProfilePic;
  final bool visiblePassword;
  final bool visibleConfirmPassword;
  final String? gender;

  const SignUpState({
    this.fname,
    this.lname,
    this.email,
    this.gender,
    this.password,
    this.confirmPassword,
    this.pickedProfilePic,
    required this.obSecurePassword,
    required this.visiblePassword,
    required this.visibleConfirmPassword,
  });

  const SignUpState.init({
    this.fname,
    this.lname,
    this.email,
    this.gender,
    this.password,
    this.confirmPassword,
    this.pickedProfilePic,
    required this.obSecurePassword,
    required this.visiblePassword,
    required this.visibleConfirmPassword,
  });

  SignUpState copyWith({
    String? fname,
    String? lname,
    String? email,
    String? gender,
    String? password,
    String? confirmPassword,
    bool? obSecurePassword,
    File? pickedProfilePic,
    bool? visiblePassword,
    bool? visibleConfirmPassword,
  }) {
    return SignUpState(
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      pickedProfilePic: pickedProfilePic ?? this.pickedProfilePic,
      obSecurePassword: obSecurePassword ?? this.obSecurePassword,
      visibleConfirmPassword:
          visibleConfirmPassword ?? this.visibleConfirmPassword,
      visiblePassword: visiblePassword ?? this.visiblePassword,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        fname,
        lname,
        email,
        password,
        confirmPassword,
        obSecurePassword,
        pickedProfilePic,
        visiblePassword,
        visibleConfirmPassword,
      ];
}
