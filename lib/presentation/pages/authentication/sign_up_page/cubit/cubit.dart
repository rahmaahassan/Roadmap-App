import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class AppSignUpCubit extends Cubit<AppSignUpState> {
  AppSignUpCubit() : super(AppSignUpInitialState());

  static AppSignUpCubit get(context) => BlocProvider.of(context);

  void userSignUp({
  required String email,
    required String password,
}) {
    emit(AppSignUpLoadingState());

  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility () {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(AppChangePasswordVisibilityState());
  }
}