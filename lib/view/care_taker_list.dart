import 'package:flutter/material.dart';

import '../controller/caretaker_controller.dart';
import '../model/caretaker_model.dart';

class CaretakerList extends StatelessWidget {
  final CaretakerController _controller = CaretakerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Choose Caretaker", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<Caretaker>>(
              future: _controller.fetchCaretakers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<Caretaker> caretakers = snapshot.data!;
                  return ListView.builder(
                    itemCount: caretakers.length,
                    itemBuilder: (context, index) {
                      return _buildCaretakerCard(caretakers[index]);
                    },
                  );
                } else {
                  return Center(child: Text('No caretakers found.'));
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }

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

  Widget _buildCaretakerCard(Caretaker caretaker) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(10),
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
                caretaker.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    caretaker.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      SizedBox(height: 40),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: caretaker.ratingColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          caretaker.rating.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          caretaker.experience,
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  Row(
                    children: [
                      _buildButton(
                          "View Details", Colors.blue.shade100, Colors.black54),
                      SizedBox(height: 6, width: 10),
                      _buildButton(
                          "Book now", Colors.amber.shade100, Colors.black),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
