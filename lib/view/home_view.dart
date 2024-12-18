import 'package:advance_bloc_usage/core/state/bloc/university_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();

  void fetchUniversities() {
    if (controller.text.trim().isEmpty) return;
    final event = UniversityEvent.fetchUniversityStart(payload: controller.text);
    context.read<UniversityBloc>().add(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities by country'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(controller: controller),
            ElevatedButton(
              onPressed: fetchUniversities,
              child: const Text('Fetch universities'),
            ),
            BlocBuilder<UniversityBloc, UniversityState>(
              builder: (context, state) {
                if (state.event == UniversityEvents.fetchUniversityStart) {
                  return const CircularProgressIndicator();
                }

                if (state.event == UniversityEvents.fetchUniversityFailure) {
                  return const Text('Failed to fetch universities');
                }

                final universities = state.universities;

                if (universities.isEmpty) {
                  return const Text('No universities found');
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: universities.length,
                    itemBuilder: (context, index) {
                      final university = universities[index];

                      return ListTile(
                        title: Text("${index + 1} ${university.name}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Country: ${university.country}"),
                            Text("Web Page: ${university.webPages.first}"),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
