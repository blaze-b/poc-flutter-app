import 'package:flutter/material.dart';
import 'package:my_grocery/web/view/components/input_outline_button.dart';
import 'package:my_grocery/web/view/components/input_text_button.dart';
import 'package:my_grocery/web/view/components/input_text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Welcome,",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Sign in to continue!",
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
                title: 'Email',
              ),
              const SizedBox(height: 10),
              InputTextField(
                title: 'Password',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
              const Spacer(),
              InputTextButton(
                title: "Sign In",
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
            ],
          ),
        ),
      ),
    );
  }
}
