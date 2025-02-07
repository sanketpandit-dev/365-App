import 'package:flutter/material.dart';

class care_taker_list extends StatelessWidget {
  final List<Map<String, dynamic>> caretakers = [
    {
      "name": "Ajay Kumar",
      "image": "asset/doctor1.jpg",
      "rating": 4.5,
      "experience": "3 Years of Experience",
      "ratingColor": Colors.green
    },
    {
      "name": "Jane Doe",
      "image": "asset/doctor2.jpg",
      "rating": 2.0,
      "experience": "2 Years of Experience",
      "ratingColor": Colors.red
    },
    {
      "name": "Ajay Kumar",
      "image": "asset/doctor3.jpg",
      "rating": 3.1,
      "experience": "5 Years of Experience",
      "ratingColor": Colors.orange
    },
    {
      "name": "Ajay Kumar",
      "image": "asset/doctor4.png",
      "rating": 4.5,
      "experience": "1 Year of Experience",
      "ratingColor": Colors.green
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Choose care taker", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: caretakers.length,
              itemBuilder: (context, index) {
                return _buildCaretakerCard(caretakers[index]);
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  // Search Bar
  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.black54),
          hintText: "Search for: Caretaker",
          hintStyle: TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }


  Widget _buildCaretakerCard(Map<String, dynamic> caretaker) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                caretaker["image"],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),

            // Caretaker Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        caretaker["name"],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: caretaker["ratingColor"],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          caretaker["rating"].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          caretaker["experience"],
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton("View Details", Colors.blue.shade100, Colors.black54),
                      SizedBox(height: 6, width: 10),
                      _buildButton("Book now", Colors.amber.shade100, Colors.black),
                    ],
                  ),


                ],

              ),
            ),

            // Buttons Section

          ],
        ),
      ),
    );
  }

  // Reusable Button
  Widget _buildButton(String text, Color backgroundColor, Color textColor) {
    return SizedBox(
      width: 90,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 12),
        ),
      ),
    );
  }

}
