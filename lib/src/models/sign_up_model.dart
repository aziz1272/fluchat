class SignUpModel {
  String email;
  String password;
  String confirmPassword;

  SignUpModel({
    required this.password,
    required this.confirmPassword,
    required this.email,
  });
}