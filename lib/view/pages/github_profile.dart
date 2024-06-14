import 'package:first_flutter_project/core/provider/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GithubProfile extends StatefulWidget {
  const GithubProfile({super.key});

  @override
  State<GithubProfile> createState() => _GithubProfileState();
}

class _GithubProfileState extends State<GithubProfile> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16) + const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is SuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfuly')));
                  } else if (state is FailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ERROR')));
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is SuccessState) {
                    final user = state.user;

                    return Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(user!.avatar),
                              ),
                              const Spacer(),
                              Column(children: [const Text('Following'), Text(user.following.toString())]),
                              const Spacer(),
                              Column(children: [const Text('Followers'), Text(user.followers.toString())]),
                              const Spacer(),
                            ],
                          ),
                          Text(user.username),
                          Text(user.name),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My repositories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is SuccessState) {
                    final repositories = state.repositories;
                    return ListView.builder(
                      controller: ScrollController(),
                      shrinkWrap: true,
                      itemCount: repositories?.length ?? 0,
                      itemBuilder: (context, index) {
                        final repository = repositories?[index];

                        return ListTile(
                          title: Text('${index + 1}.  ${repository?.name}'),
                          subtitle: Text(repository?.description ?? ''),
                          trailing: Text(repository!.starsCount.toString()),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 100),
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(fillColor: Colors.black12, filled: true, hintText: 'username'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (controller.text.trim().isEmpty) return;
                  context.read<ProfileBloc>().add(GetUsersInformationEvent(username: controller.text.trim()));
                },
                child: const Text('Search'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
