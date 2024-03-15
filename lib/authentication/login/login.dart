import 'package:flutter/material.dart';
import 'package:onboarding/authentication/forgot.dart';
import 'package:onboarding/authentication/register.dart';
import 'package:onboarding/dashboard/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //We need two text editing controller

  //TextEditing controller to control the text when we enter into it
  final email = TextEditingController();
  final password = TextEditingController();
  String em = "";
    RegExp get passwordRegExp =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  RegExp get _emailRegex => RegExp(
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');

  //A bool variable for show and hide password
  bool isVisible = false;

  //Here is our bool variable
  bool isLoginTrue = false;

  //Now we should call this function in login button
  login() async {
    //If login is correct, then goto notes
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Dashboard()));
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              //We put all our textfield to a form to be controlled and not allow as empty
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    //Username field

                    //Before we show the image, after we copied the image we need to define the location in pubspec.yaml
                    Image.asset(
                      "assets/images/hellocuate.png",
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
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextFormField(
                            controller: email,
                            validator: (em) {
                              if (em == null || em.isEmpty) {
                                return 'Please enter your email';
                              } else if (!_emailRegex.hasMatch(em)) {
                                return 'Email address is not valid';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                _emailRegex.hasMatch(email.text)
                                    ? Icons.alternate_email_outlined
                                    : Icons.alternate_email_outlined,
                                // color: email.text.isEmpty
                                //     ? Colors.black
                                //     : _emailRegex.hasMatch(email.text)
                                //         ? Colors.deepPurple
                                //         : Colors.red,
                              ),
                              suffixIcon: Icon(
                                email.text.isEmpty
                                    ? null
                                    : _emailRegex.hasMatch(email.text)
                                        ? Icons.check
                                        : Icons.clear,
                                color: email.text.isEmpty
                                    ? Colors.black
                                    : _emailRegex.hasMatch(email.text)
                                        ? const Color(0xFF8D3AF8)
                                        : Colors.red,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: email.text.isEmpty
                                      ? Colors.black
                                      : _emailRegex.hasMatch(email.text)
                                          ? const Color(0xFF8D3AF8)
                                          : Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: email.text.isEmpty
                                      ? Colors.black
                                      : _emailRegex.hasMatch(email.text)
                                          ? const Color(0xFF8D3AF8)
                                          : Colors.red,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: email.text.isEmpty
                                      ? Colors.black
                                      : _emailRegex.hasMatch(email.text)
                                          ? const Color(0xFF673AB7)
                                          : Colors.red,
                                ),
                              ),
                              hintText: "Enter your email...",
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Password field
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                            obscureText: !isVisible,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Enter your password...",
                              prefixIcon: const Icon(Icons.lock_outlined),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              var materialPageRoute = MaterialPageRoute(
                                  builder: (context) => const Forgot());
                              Navigator.push(context, materialPageRoute);
                            },
                            child: const Text("Forgot Password?"))
                      ],
                    ),
                    const SizedBox(height: 10),
                    //Login button
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF5B2A9A)),
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              //Login method will be here
                              login();

                              //Now we have a response from our sqlite method
                              //We are going to create a user
                            }
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),

                    //Sign up button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              //Navigate to sign up
                              var materialPageRoute = MaterialPageRoute(
                                  builder: (context) => const Register());
                              Navigator.push(context, materialPageRoute);
                            },
                            child: const Text("Create Account"))
                      ],
                    ),

                    // We will disable this message in default, when user and pass is incorrect we will trigger this message to user
                    isLoginTrue
                        ? const Text(
                            "Username or passowrd is incorrect",
                            style: TextStyle(color: Colors.red),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
