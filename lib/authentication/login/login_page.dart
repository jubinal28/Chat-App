import 'package:flutter/material.dart';
import 'package:onboarding/authentication/register.dart';

class LoginPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final Function onNext;
  final bool isLastStep;

  const LoginPage({super.key, 
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.obscureText,
    required this.validator,
    required this.controller,
    required this.onNext,
    this.isLastStep = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 210,
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      TextFormField(
                        controller: controller,
                        validator: validator,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(icon),
                          hintText: subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
                // Buttons for navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isLastStep)
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Previous"),
                      ),
                    TextButton(
                      onPressed: () {
                        onNext();
                      },
                      child: Text(isLastStep ? "Login" : "Next"),
                    ),
                  ],
                ),
                // Sign up button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign up
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Register()),
                        );
                      },
                      child: const Text("Create Account"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
