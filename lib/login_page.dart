import 'package:flutter/material.dart';

import 'custom_textfileds.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    
    emailAddressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildHeader(),
          const SizedBox(height: 20),
          Expanded(child: buildBottomView()),
        ],
      ),
    );
  }

  Widget buildHeader() {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.25,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),

                    const SizedBox(height: 12),
                    const Text(
                      "Let's drive into your account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTextFields(),
          const SizedBox(height: 10),
          buildButtons(),
          const SizedBox(height: 10),
          buildLoginWith(),
        ],
      ),
    );
  }

  Widget buildTextFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Enter email',
            prefixIcon: const Icon(Icons.email),
            controller: emailAddressController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Enter password',
            prefixIcon: const Icon(Icons.lock),
            controller: passwordController,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.yellow,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {},
            child: const Text(
              'Sign in',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),

          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text(
              'Dont have an account? Sign up',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginWith() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: Divider(color: Colors.grey, thickness: 1)),

              const SizedBox(width: 12),
              const Text(
                'OR LOGIN WITH',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialButton(Icons.apple),
              const SizedBox(width: 12),
              buildSocialButton(Icons.facebook),
              const SizedBox(width: 12),
              buildSocialButton(Icons.email),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSocialButton(IconData icon) {
    return Material(
     elevation: 10,
     shape: const CircleBorder(),
     shadowColor: Colors.black26,
      // decoration: BoxDecoration(
        
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.2),
      //       blurRadius: 0.5,
      //       offset: const Offset(0,10)
      //     )
      //   ]
      // ),
      child: TextButton(
        style: TextButton.styleFrom(
          // fixedSize: const Size(20, 20),
          padding: EdgeInsets.all(8),
          shape: const CircleBorder(),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        onPressed: () {},
        child:  Icon(icon, size: 40),
      ),
    );
  }
}
