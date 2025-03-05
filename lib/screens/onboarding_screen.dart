import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": "images/Illustration_Onboarding_1.png",
      "title": "Welcome to Marketi",
      "description":
          "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
    },
    {
      "image": "images/Illustration_Onboarding_2.png",
      "title": "Easy to Buy",
      "description":
          "Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier..",
    },
    {
      "image": "images/Illustration_Onboarding_3.png",
      "title": "Wonderful User Experience",
      "description":
          "Start exploring now and experience the convenience of online shopping at its best.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(onboardingData[index]["image"]!, height: 250),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[index]["title"]!,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        onboardingData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_currentIndex == onboardingData.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(347, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                _currentIndex == onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5), 
      height: _currentIndex == index ? 17 : 13, 
      width: _currentIndex == index ? 17 : 13,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.black : Colors.blue.shade100, 
      ),
    );
  }
}
