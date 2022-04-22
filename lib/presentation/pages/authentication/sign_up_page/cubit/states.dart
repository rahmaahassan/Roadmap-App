abstract class AppSignUpState {}

class AppSignUpInitialState extends AppSignUpState {}

class AppSignUpLoadingState extends AppSignUpState {}

class AppSignUpSuccessState extends AppSignUpState {}

class AppSignUpErrorState extends AppSignUpState {
  final String error;

  AppSignUpErrorState(this.error);
}

class AppChangePasswordVisibilityState extends AppSignUpState {}
