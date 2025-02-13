import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter

import 'homescreen.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  OtpScreen({required this.phoneNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  bool isOtpFilled = false;
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
          timer.cancel();
        });
      }
    });
  }

  void resendOtp() {
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String maskedNumber = "XXXXXXX" + widget.phoneNumber.substring(widget.phoneNumber.length - 2);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Text('OTP Verification',style: TextStyle(
            fontSize: 13,
          ),),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "OTP Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Enter verification code",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text(
              "We have sent you a 4-digit verification code on",
              style: TextStyle(color: Colors.black54),
            ),
            Text(
              maskedNumber,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              appContext: context,
              length: 4,
              controller: otpController,
              onChanged: (value) {
                setState(() {
                  isOtpFilled = value.length == 4;
                });
              },
              keyboardType: TextInputType.number,
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.black,
                inactiveColor: Colors.black26,
                selectedColor: Colors.orangeAccent,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Add this line to restrict input to digits only
            ),
            SizedBox(height: 10),
            Text(
              secondsRemaining > 0
                  ? "00:${secondsRemaining.toString().padLeft(2, '0')}"
                  : "",
              style: TextStyle(fontSize: 16, color: Colors.orangeAccent),
            ),
            TextButton(
              onPressed: enableResend ? resendOtp : null,
              child: Text(
                "Resend OTP",
                style: TextStyle(
                  color: enableResend ? Colors.blue : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isOtpFilled ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isOtpFilled ? Colors.orange : Colors.grey,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
