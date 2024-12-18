part of 'university_bloc.dart';

enum UniversityEvents {
  fetchUniversityStart,
  fetchUniversitySuccess,
  fetchUniversityFailure,
}

class UniversityEvent {
  UniversityEvents? type;
  dynamic payload;

  UniversityEvent.fetchUniversityStart({required this.payload}) {
    type = UniversityEvents.fetchUniversityStart;
  }
}
