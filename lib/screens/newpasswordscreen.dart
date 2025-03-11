import 'package:flutter/material.dart';
import 'package:market/screens/passwordupdatescreen.dart';
import 'package:market/widgets/custom_text_field.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  @override
  _CreateNewPasswordScreenState createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
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
        title: const Text("Create New Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/Illustration_Create_New_Password.png',
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "New password must be different from last password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PasswordUpdatedScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Save Password",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
