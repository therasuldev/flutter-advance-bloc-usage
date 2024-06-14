part of 'profile_bloc.dart';

sealed class ProfileState {}

class InitialState extends ProfileState {}

class LoadingState extends ProfileState {}

class SuccessState extends ProfileState {
  final User? user;
  final List<Repository>? repositories;

  SuccessState({this.user, this.repositories});
}

class FailureState extends ProfileState {
  final String errorMessage;
  FailureState({required this.errorMessage});
}
