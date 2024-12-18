import 'package:advance_bloc_usage/core/models/university.dart';
import 'package:advance_bloc_usage/core/service/remote/university_service.dart';
import 'package:bloc/bloc.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc() : super(UniversityState.initial()) {
    on<UniversityEvent>((event, emit) async {
      switch (event.type) {
        case UniversityEvents.fetchUniversityStart:
          await _onFetchUniversity(event, emit);
          break;
        default:
      }
    });
  }

  Future<void> _onFetchUniversity(UniversityEvent event, Emitter<UniversityState> emit) async {
    emit(UniversityState(
      universities: [],
      event: UniversityEvents.fetchUniversityStart,
    ));

    try {
      final universities = await _universityService.fetchUniversity(country: event.payload);
      emit(UniversityState(
        universities: universities,
        event: UniversityEvents.fetchUniversitySuccess,
      ));
    } catch (e) {
      print(e);
      emit(UniversityState(
        universities: [],
        event: UniversityEvents.fetchUniversityFailure,
      ));
    }
  }

  final UniversityService _universityService = UniversityService.instance;
}
