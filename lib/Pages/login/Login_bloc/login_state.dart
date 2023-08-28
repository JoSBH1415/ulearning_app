class LoginState {
  final String email;
  final String password;
  // ignore: non_constant_identifier_names
  final bool icon_eye;

  const LoginState({this.email = "", this.password = "", this.icon_eye = true});

  LoginState copyWith({String? email, String? password, bool? icon_eye}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        icon_eye: icon_eye ?? this.icon_eye);
  }
  
}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class LoginValidState extends LoginState {}
