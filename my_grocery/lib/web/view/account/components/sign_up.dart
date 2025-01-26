import 'package:flutter/material.dart';
import 'package:my_grocery/extention/string_extention.dart';
import 'package:my_grocery/web/controller/controllers.dart';
import 'package:my_grocery/web/view/account/components/sign_in.dart';
import 'package:my_grocery/web/view/components/input_outline_button.dart';
import 'package:my_grocery/web/view/components/input_text_button.dart';
import 'package:my_grocery/web/view/components/input_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey, //form key input
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Create Account,",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign up to start!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                InputTextField(
                  title: 'Full Name',
                  textEditingController: fullNameController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Email',
                  textEditingController: emailController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidEmail) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Password',
                  obsecureText: true,
                  textEditingController: passwordController,
                  validation: (String? value) {
                    List<String> validation = [];
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else {
                      if (!value.isValidPasswordHasNumber) {
                        validation.add("Must contain 1 number");
                      }
                      if (!value.isValidPasswordHasCapitalLetter) {
                        validation.add("Must contain 1 capital letter");
                      }
                      if (!value.isValidPasswordHasLowerCaseLetter) {
                        validation.add("Must contain 1 simple letter");
                      }
                      if (!value.isValidPasswordHasSpecialCharacter) {
                        validation.add(
                            "Must contain 1 special character[! @ # \$ %]");
                      }
                    }
                    String msg = '';
                    if (validation.isNotEmpty) {
                      for (var i = 0; i < validation.length; i++) {
                        msg = msg + validation[i];
                        if ((i + 1) != validation.length) {
                          msg = "$msg\n";
                        }
                      }
                    }
                    return msg.isNotEmpty ? msg : null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Confirm Password',
                  obsecureText: true,
                  textEditingController: confirmController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (passwordController.text != value) {
                      return "Confirm password not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Spacer(),
                InputTextButton(
                  title: "Sign Up",
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.signUp(
                        fullName: fullNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                InputOutlineButton(
                  title: "Back",
                  onClick: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(
                  flex: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I'm already a member, "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
