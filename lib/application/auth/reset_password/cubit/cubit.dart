import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';


class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  void resetPassword({
    required String oldPassword,
    required String newPassword,
    required String repeatPassword,
}) {
    emit(ResetPasswordLoadingState());

  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility () {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(AppChangePasswordVisibilityState());
  }
}