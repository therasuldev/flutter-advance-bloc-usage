import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_flutter_project/core/model/user_model.dart';
import 'package:first_flutter_project/core/provider/app_bloc/app_event.dart';
import 'package:first_flutter_project/core/provider/app_bloc/app_state.dart';
import 'package:first_flutter_project/core/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  // Map<String, List<User>> cachedUsers = {};

  late ApiService _apiService;

  AppBloc() : super(InitialState()) {
    _apiService = ApiService();
    on<GetUsersEvent>(_fetchUser);
    on<PostUserEvent>(_postUser);
  }

  _fetchUser(GetUsersEvent event, Emitter<AppState> emit) async {
    emit(LoadingState());
    try {
      //if (cachedUsers['cache']?.isEmpty ?? true) {
      // log('KES BOSDUR');
      // final datas = await _apiService.fetchUsers();
      // final users = datas.map((userJson) => User.fromJson(userJson)).toList();
      //cachedUsers['cache'] = users;
      // emit(SuccessState(users: users));
      // } else {
      //   log('KES ARTIQ MOVCUDDUR');
      //   emit(SuccessState(users: cachedUsers['cache']!));
      // }
    } catch (exp) {
      log(exp.toString());
      emit(FailureState());
    }
  }

  _postUser(PostUserEvent event, Emitter<AppState> emit) {}
}
