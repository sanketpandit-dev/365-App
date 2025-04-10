import 'package:flutter/material.dart';
import 'package:healthcare/view/homescreen.dart';

import 'care_taker_list.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String _selectedCity = "Mumbai"; // State to hold the selected city

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
        ),
        title: Text("Choose care taker", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Address Details Title
            Text(
              "Address Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _buildDropdown(),

            SizedBox(height: 16),
            _buildInputField("Home Address", "Address here", maxLines: 4),
            SizedBox(height: 16),
            _buildInputField("Pincode", "Enter Pincode", keyboardType: TextInputType.number),

            SizedBox(height: 24),
            _buildHomeCareInfo(),
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildFixedButton(context),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: _inputDecoration(),
      child: Row(
        children: [
          Icon(Icons.location_city, color: Colors.black),
          SizedBox(width: 10),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedCity,
                items: [
                  DropdownMenuItem(value: "Mumbai", child: Text("Mumbai")),
                  DropdownMenuItem(value: "Delhi", child: Text("Delhi")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          decoration: _inputDecoration(),
          child: TextField(
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: _textFieldDecoration(hint),
          ),
        ),
      ],
    );
  }

  Widget _buildHomeCareInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Home Care, On Demand", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 16),

        Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.check_circle, Colors.green, "100+ Care Buddies to take \n care  of your loved one"),
                  _buildInfoRow(Icons.verified, Colors.blue, "Verified and Experienced \n Professionals"),
                  _buildInfoRow(Icons.people, Colors.orange, "Trusted by 1Mn+ People  \n Across World"),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Right Half: Image
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/faq.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(icon, color: color),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }

  Widget _buildFixedButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CaretakerList()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text("NEXT STEP >", style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }

  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    );
  }

  InputDecoration _textFieldDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(15),
    );
  }
}
