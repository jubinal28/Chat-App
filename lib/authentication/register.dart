import 'package:flutter/material.dart';
import 'package:onboarding/authentication/login/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  String fn = "";
  String ln = "";
  String em = "";
  String pw = "";
  // String pw = "";
  // String cpw = "";
  RegExp get passwordRegExp =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  RegExp get nameRegExp =>
      RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']|))+[A-Za-z]+\.?\s*$");
  RegExp get _emailRegex => RegExp(
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');

  final formKey = GlobalKey<FormState>();

  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Register",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                            'First Name',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextFormField(
                            controller: firstname,
                            validator: (fn) {
                              if (fn == null || fn.isEmpty) {
                                return 'Please enter your first name';
                              } else if (!nameRegExp.hasMatch(fn)) {
                                return 'Fisrt name is not valid';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(),
                              hintText: "Enter your first name...",
                            ),
                          ),
                        ],
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
                            'Last Name',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextFormField(
                            controller: lastname,
                            validator: (ln) {
                              if (ln == null || ln.isEmpty) {
                                return 'Please enter your last name';
                              } else if (!nameRegExp.hasMatch(ln)) {
                                return 'Last name is not valid';
                              }
                              return null;
                            },
                            // validator: (ln) {
                            //   if (ln!.isEmpty) {
                            //     return "Last name is required";
                            //   }
                            //   return null;
                            // },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(),
                              hintText: "Enter your last name...",
                            ),
                          ),
                        ],
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
                                borderSide: BorderSide(
                                  color: email.text.isEmpty
                                      ? Colors.black
                                      : _emailRegex.hasMatch(email.text)
                                          ? Colors.deepPurple
                                          : Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: email.text.isEmpty
                                      ? Colors.black
                                      : _emailRegex.hasMatch(email.text)
                                          ? Colors.deepPurple
                                          : Colors.red,
                                ),
                              ),
                              border: OutlineInputBorder(
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
                            validator: (pw) {
                              if (pw == null || pw.isEmpty) {
                                return 'Please enter your password';
                              } else if (!passwordRegExp.hasMatch(pw)) {
                                return 'Password is not valid';
                              }
                              return null;
                            },
                            obscureText: !isVisiblePassword,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Enter your password...",
                              prefixIcon: const Icon(Icons.lock_outlined),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisiblePassword = !isVisiblePassword;
                                  });
                                },
                                icon: Icon(isVisiblePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                        ],
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
                            'Confirm Password',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextFormField(
                            controller: confirmPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              } else if (password.text !=
                                  confirmPassword.text) {
                                return "Passwords don't match";
                              }
                              return null;
                            },
                            obscureText: !isVisibleConfirmPassword,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Enter your confirm password...",
                              prefixIcon: const Icon(Icons.lock_outlined),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibleConfirmPassword =
                                        !isVisibleConfirmPassword;
                                  });
                                },
                                icon: Icon(isVisibleConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              agreeToTerms = value!;
                            });
                          },
                        ),
                        const Text(
                          'By creating an account, you agree to our Term and Conditions',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 104, 57, 187)),
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                agreeToTerms) {
                              // Signup method will be here
                              // For now, just navigate to login screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text("Already have an account?"),
                    //     TextButton(
                    //         onPressed: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => const Login()));
                    //         },
                    //         child: const Text("Login"))
                    //   ],
                    // )
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
