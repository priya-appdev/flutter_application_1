import 'package:flutter/material.dart';
import 'custom_textfileds.dart';
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool receivePromotionalEmails = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildHeader(),
          const SizedBox(height: 20),
          Expanded( // beciase takes availabel space from headerview till bottom
            child: buildBottomView()
          )
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Skip",
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
                      'Sign up',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Let's driven into your account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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

  Widget buildTextFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          CustomTextField(
            hintText: 'First name',
            prefixIcon: const Icon(Icons.person),
            controller: firstNameController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Last name',
            prefixIcon: const Icon(Icons.person),
            controller: lastNameController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Email address',
            prefixIcon: const Icon(Icons.email),
            controller: emailController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Retypepassword',
            prefixIcon: const Icon(Icons.lock),
            controller: confirmPasswordController,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget buildPromotionalEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                receivePromotionalEmails = !receivePromotionalEmails;
              });
            },
            icon: Icon(
              receivePromotionalEmails
                  ? (Icons.check_circle)
                  : (Icons.radio_button_unchecked),
            ),
          ),
          const SizedBox(width: 2),
          const Text(
            "I'd like to receive promotional emails",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget buildCreateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.yellow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () {},
        child: const Text(
          'Register',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildTerms() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'By Signing up for an account, I agree to the Terms & Confitions.Learn more about how we use and protect your data in our Privacy Policy',
        style: TextStyle(color: Colors.grey, fontSize: 15),
      ),
    );
  }

   Widget buildBottomView(){
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTextFields(),
          const SizedBox(height: 10),
          buildPromotionalEmail(),
          const SizedBox(height: 18),
          buildCreateButton(),
          const SizedBox(height: 20),
          buildTerms(),
        ],
      ),
    );
   }
}

