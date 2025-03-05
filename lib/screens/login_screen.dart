import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = true;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    'images/Logo_Splash_Screen.png',
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),
                const CustomTextField(
                  icon: Icons.email_outlined,
                  hintText: 'Username or Email',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  icon: Icons.lock_outline_rounded,
                  hintText: 'Password',
                  obscureText: _obscurePassword,
                  suffixIcon:
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  onSuffixTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        const Text('Remember Me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
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
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Or Continue With',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Are you new in Marketi? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 58, 
            left: 14, 
            child: Container(
              width: 54,
              height: 43, 
              padding: const EdgeInsets.all(10), 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), 
                border: Border.all(color: Colors.blue.shade100, width: 1),
                color: Colors.white,
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, 
                  ),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16, 
                      color: Colors.blue.shade700, 
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
