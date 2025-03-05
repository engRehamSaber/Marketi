import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/name_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, 
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade100, width: 2),
            ),
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.black, size: 18),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'images/Logo_Splash_Screen.png',
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text("Full Name", style: TextStyle(fontSize: 12)),
              const NameField(
                  svgIcon: 'images/Name_Icon.svg', hintText: 'Full Name'),
              const SizedBox(height: 10),
              const Text("Username", style: TextStyle(fontSize: 12)),
              const NameField(
                  svgIcon: 'images/User_Icon.svg', hintText: 'Username'),
              const SizedBox(height: 10),
              const Text("Phone Number", style: TextStyle(fontSize: 12)),
              const NameField(
                  svgIcon: 'images/Phone_Icon.svg',
                  hintText: '+20 1501142409 '),
              const SizedBox(height: 10),
              const Text("Email", style: TextStyle(fontSize: 12)),
              const CustomTextField(
                  icon: Icons.email_outlined, hintText: 'Email'),
              const SizedBox(height: 10),
              const Text("Password", style: TextStyle(fontSize: 12)),
              CustomTextField(
                icon: Icons.lock_outline_rounded,
                hintText: 'Password',
                obscureText: !isPasswordVisible,
                suffixIcon:
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                onSuffixTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text("Confirm Password", style: TextStyle(fontSize: 12)),
              CustomTextField(
                icon: Icons.lock_outline_rounded,
                hintText: 'Confirm Password',
                obscureText: !isConfirmPasswordVisible,
                suffixIcon: isConfirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixTap: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  minimumSize: const Size(347, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Or Continue With',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialIcon(Icons.g_translate),
                  const SizedBox(width: 10),
                  buildSocialIcon(Icons.apple),
                  const SizedBox(width: 10),
                  buildSocialIcon(Icons.facebook),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocialIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue.shade100, width: 1),
      ),
      child: Center(
        child: Icon(icon, size: 20, color: Colors.black),
      ),
    );
  }
}
