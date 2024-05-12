import 'dart:math';

import 'package:first_flutter_project/view/pages/user.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  bool _value = false, isVisible = false;
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create an account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Welcome! Please enter your details.',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(.6),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Name',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Name field is required';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(.3),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: 'Enter your name',
                prefixIcon: const Icon(Icons.person, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Email field is required';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(.3),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: passwordController,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Password field is required';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: isVisible,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(.3),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: '*********',
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(!isVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  fillColor: MaterialStateProperty.all(Colors.white),
                  activeColor: Colors.green,
                  checkColor: Colors.green,
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value ?? false;
                    });
                  },
                ),
                const Text(
                  'Must be at least 8 characters',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                if ((formKey.currentState?.validate() ?? false) && _value) {
                  builder(BuildContext context) {
                    return UserPage(
                      username: nameController.text,
                      email: emailController.text,
                    );
                  }

                  final route = MaterialPageRoute(builder: builder);
                  Navigator.push(context, route);
                }
              },
              child: Container(
                height: 60,
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Colors.pink, Colors.red],
                    transform: GradientRotation(pi * 1.5),
                  ),
                ),
                child: const Text('Sign up'),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 60,
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: Image.network(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fen%2Fsearch%3Fq%3Dgoogle&psig=AOvVaw0MoUt3O4KDPEsglgIYaQ1a&ust=1715622291644000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJif1ZvViIYDFQAAAAAdAAAAABAE',
                  errorBuilder: (context, error, stackTrace) {
                    print(error);
                    return const CircleAvatar();
                  },
                ),
                label: const Text('Sign up with Google'),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 60,
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.person),
                label: const Text('Sign up with Facebook'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
