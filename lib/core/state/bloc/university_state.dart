part of 'university_bloc.dart';

class UniversityState {
  final List<University> universities;
  final UniversityEvents? event;

  UniversityState({
    required this.universities,
    required this.event,
  });

  factory UniversityState.initial() {
    return UniversityState(
      universities: [],
      event: null,
    );
  }
}
