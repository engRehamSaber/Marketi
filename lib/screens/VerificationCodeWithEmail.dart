import 'package:flutter/material.dart';
import 'package:market/screens/newpasswordscreen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class OtpVerificationWithEmail extends StatefulWidget {
  const OtpVerificationWithEmail({super.key});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationWithEmail> {
  TextEditingController otpController = TextEditingController();
  int _resendTime = 60;
  bool _canResend = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  void startResendTimer() {
    _canResend = false;
    setState(() {});
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTime > 0) {
        setState(() {
          _resendTime--;
        });
      } else {
        _canResend = true;
        _timer?.cancel();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
        title: const Text(
          "Verification Code",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('images/Illustration_Verification_Code_With_Email.png',
                height: 200),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Please enter the 4 digit code sent to: ",
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: "+20 1501142409",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: otpController,
              keyboardType: TextInputType.number,
              obscureText: false,
              animationType: AnimationType.fade,
              mainAxisAlignment: MainAxisAlignment.center, 
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 60,
                fieldWidth: 45, 
                borderWidth: 2,
                activeFillColor: Colors.transparent,
                selectedFillColor: Colors.transparent,
                inactiveFillColor: Colors.transparent,
                inactiveColor: Colors.grey.shade400,
                activeColor: Colors.blue.shade700,
                selectedColor: Colors.blue,
                fieldOuterPadding: const EdgeInsets.all(5),
              ),
              cursorColor: Colors.blue,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: false,
              onCompleted: (value) {
                print("OTP Entered: $value");
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNewPasswordScreen()),
                  );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(347, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Verify Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              _resendTime > 0
                  ? "00:$_resendTime"
                  : "now you can resend the code",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            TextButton(
              onPressed: _canResend
                  ? () {
                      setState(() {
                        _resendTime = 60;
                        startResendTimer();
                      });
                    }
                  : null,
              child: const Text(
                "Resend Code",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
