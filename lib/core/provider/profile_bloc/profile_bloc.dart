import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_flutter_project/core/model/repository_model.dart';
import 'package:first_flutter_project/core/model/user_model.dart';
import 'package:first_flutter_project/core/service/api_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : _apiService = ApiService(),
        super(InitialState()) {
    on<GetUsersInformationEvent>(_getUsersInformationEvent);
  }

  _getUsersInformationEvent(GetUsersInformationEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingState());
    try {
      final user = await _apiService.getUsersInformation(event.username);
      final repositories = await _apiService.getUsersRepositories(event.username);
      emit(SuccessState(user: user, repositories: repositories));
    } catch (errorMessage) {
      log(errorMessage.toString());
      emit(FailureState(errorMessage: errorMessage.toString()));
    } finally {}
  }

  late final ApiService _apiService;
}