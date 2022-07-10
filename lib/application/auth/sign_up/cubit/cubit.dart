import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/user_model.dart';
import 'states.dart';

class AppSignUpCubit extends Cubit<AppSignUpStates> {
  AppSignUpCubit() : super(AppSignUpInitialState());

  static AppSignUpCubit get(context) => BlocProvider.of(context);

  void userSignUp({
    required String name,
    required String email,
    required String password,
  }) {
    emit(AppSignUpLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        email: email,
        name: name,
      );
    }).catchError((error) {
      emit(AppSignUpErrorState(error));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      uId: uId,
      // image: 'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      // isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(AppChangePasswordVisibilityState());
  }
}
