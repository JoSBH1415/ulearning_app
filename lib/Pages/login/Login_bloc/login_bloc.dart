import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/Pages/login/Login_bloc/login_event.dart';
import 'package:ulearning_app/Pages/login/Login_bloc/login_state.dart';

class LoginBloc extends Bloc<loginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<LoginChangeIconEyeEvent>(_iconEyeEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    print("email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    print("password is ${event.password}");

    emit(state.copyWith(password: event.password));
  }

  void _iconEyeEvent(LoginChangeIconEyeEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(icon_eye: !state.icon_eye));
  }
}
