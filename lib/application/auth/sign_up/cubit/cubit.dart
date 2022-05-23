import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class AppSignUpCubit extends Cubit<AppSignUpStates> {
  AppSignUpCubit() : super(AppSignUpInitialState());

  static AppSignUpCubit get(context) => BlocProvider.of(context);

  void userSignUp({
    required String name,
    required String email,
    required String password,
  }) {
    print('hello');
    emit(AppSignUpLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
          print(value.user?.email),
          print(value.user?.uid),

          emit(AppSignUpSuccessState())})
        .catchError((error) {
      emit(AppSignUpErrorState(error));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(AppChangePasswordVisibilityState());
  }
}
