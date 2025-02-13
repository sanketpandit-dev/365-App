import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'otpscreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  bool isPhoneNumberValid = false;
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Column(
              children: [
                Icon(Icons.volunteer_activism_outlined, size: 80, color: Colors.orangeAccent),
                SizedBox(height: 10),
                Text(
                  "With us,",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  "Care Begins at Home",
                  style: TextStyle(fontSize: 16, color: Colors.orangeAccent, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Login with number",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            IntlPhoneField(

              controller: phoneController,
              decoration: InputDecoration(

                labelText: 'Mobile Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'IN',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (PhoneNumber phone) {
                setState(() {
                  phoneNumber = phone.completeNumber;
                  isPhoneNumberValid = phone.isValidNumber();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isPhoneNumberValid
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(phoneNumber: phoneNumber),
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isPhoneNumberValid ? Colors.orange : Colors.grey,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text("Send OTP", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Terms of service", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black54)),
                SizedBox(width: 10),
                Text("Privacy policy", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black54)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
