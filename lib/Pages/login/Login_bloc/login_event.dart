abstract class loginEvent {
  const loginEvent();
}

class EmailEvent extends loginEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends loginEvent {
  final String password;
  const PasswordEvent(this.password);
}

class LoginChangeIconEyeEvent extends loginEvent {}
