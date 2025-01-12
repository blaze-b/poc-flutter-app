import 'package:flutter/material.dart';
import 'package:my_grocery/web/view/account/components/sign_in.dart';
import 'package:my_grocery/web/view/components/input_outline_button.dart';
import 'package:my_grocery/web/view/components/input_text_button.dart';
import 'package:my_grocery/web/view/components/input_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
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
              ),
              const SizedBox(height: 10),
              InputTextField(
                title: 'Email',
              ),
              const SizedBox(height: 10),
              InputTextField(
                title: 'Password',
              ),
              const SizedBox(height: 10),
              InputTextField(
                title: 'Confirm Password',
              ),
              const SizedBox(height: 10),
              const Spacer(),
              InputTextButton(
                title: "Sign Up",
                onClick: () {},
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
                              builder: (context) => const SignIn()));
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
    );
  }
}
