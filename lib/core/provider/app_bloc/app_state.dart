import 'package:first_flutter_project/core/model/user_model.dart';

sealed class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class SuccessState extends AppState {
  final List<User> users;

  SuccessState({required this.users});
}

class FailureState extends AppState {}
