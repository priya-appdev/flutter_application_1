import 'package:flutter/material.dart';

import 'custom_textfileds.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailAddresscontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailAddresscontroller.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildHeader(),
          SizedBox(height: 20),
          Expanded(child: buildBottomView()),
        ],
      ),
    );
  }

  Widget buildHeader() {
    final screenHeight = MediaQuery.of(context).size.height;

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
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),

                    SizedBox(height: 12),
                    Text(
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
          buildTextfields(),
          SizedBox(height: 10),
          buildButtons(),
          SizedBox(height: 10),
          buildLoginWith(),
        ],
      ),
    );
  }

  Widget buildTextfields() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Enter email',
            prefixIcon: Icon(Icons.email),
            controller: emailAddresscontroller,
          ),
          SizedBox(height: 20),
          CustomTextField(
            hintText: 'Enter password',
            prefixIcon: Icon(Icons.lock),
            controller: passwordController,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
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

          SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: Size(double.infinity, 50),
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
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey, thickness: 1)),

              SizedBox(width: 12),
              Text(
                'OR LOGIN WITH',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(width: 12),
              Expanded(child: Divider(color: Colors.grey, thickness: 1)),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialButton(Icons.apple),
              SizedBox(width: 12),
              buildSocialButton(Icons.facebook),
              SizedBox(width: 12),
              buildSocialButton(Icons.email),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSocialButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 0.5,
            offset: const Offset(0,10)
          )
        ]
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          side: BorderSide(color: Colors.grey, width: 1),
        ),
        onPressed: () {},
        child:  Icon(icon, size: 40),
      ),
    );
  }
}
