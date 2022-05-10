abstract class AppSignUpStates {}

class AppSignUpInitialState extends AppSignUpStates {}

class AppSignUpLoadingState extends AppSignUpStates {}

class AppSignUpSuccessState extends AppSignUpStates {}

class AppSignUpErrorState extends AppSignUpStates {
  final String error;

  AppSignUpErrorState(this.error);
}

class AppChangePasswordVisibilityState extends AppSignUpStates {}
