part of 'profile_bloc.dart';

sealed class ProfileEvent {}

class GetUsersInformationEvent extends ProfileEvent {
  final String username;

  GetUsersInformationEvent({required this.username});
}
