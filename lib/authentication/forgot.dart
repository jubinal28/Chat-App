import 'package:flutter/material.dart';
import 'package:onboarding/onboarding/onboarding.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final email = TextEditingController();
  final password = TextEditingController();
  String em = "";
  RegExp get _emailRegex => RegExp(
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');

  bool isVisible = false;
  bool isForgotTrue = false;

//   Color _getBorderColor(String text) {
//   if (text.isEmpty) {
//     return Colors.black; // Or any default color when no text is entered
//   } else {
//     return _emailRegex.hasMatch(text) ? Colors.deepPurple : Colors.red;
//   }
// }

  forgot() async {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Onboarding()),
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/forgotpasswordcuate.png",
                      width: 210,
                    ),
                    const SizedBox(height: 15),
                    const Center(
                      child: Text(
                        "Forgot Password",
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
                                        ? Colors.deepPurple
                                        : Colors.red,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius : BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: email.text.isEmpty
                                      ? Colors.black
                                      : _emailRegex.hasMatch(email.text)
                                          ? Colors.deepPurple
                                          : Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius : BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: email.text.isEmpty
                                      ? Colors.black
                                      : _emailRegex.hasMatch(email.text)
                                          ? Colors.deepPurple
                                          : Colors.red,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius : BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: email.text.isEmpty
                                      ? Colors.black
                                      : _emailRegex.hasMatch(email.text)
                                          ? Colors.deepPurple
                                          : Colors.red,
                                ),
                              ),
                              hintText: "Enter your email...",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 250),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple),
                      child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Center(
                                      child: Text(
                                    "Success!",
                                    style: TextStyle(color: Colors.green),
                                  )),
                                  content: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          "Your new password has been emailed. Please check your email to change your password immediately.",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                  actions: [
                                    Container(
                                      height: 55,
                                      width: MediaQuery.of(context).size.width *
                                          .9,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.deepPurple),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Return",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Send",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // isForgotTrue
                    //     ? const Text(
                    //         "Username or password is incorrect",
                    //         style: TextStyle(color: Colors.red),
                    //       )
                    //     : const SizedBox(),
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
