import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});

  final List<Testimonial> testimonials = [
    Testimonial(
      name: "John Doe",
      memberSince: "Oct 2022",
      review:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's Lorem Ipsum is simply dummy text of the printing.",
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      rating: 5,
    ),
    Testimonial(
      name: "John Doe",
      memberSince: "Oct 2022",
      review:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's Lorem Ipsum is simply dummy text of the printing.",
      imageUrl: "https://randomuser.me/api/portraits/men/5.jpg",
      rating: 5,
    ),
    Testimonial(
      name: "John Doe",
      memberSince: "Oct 2022",
      review:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's Lorem Ipsum is simply dummy text of the printing.",
      imageUrl: "https://randomuser.me/api/portraits/men/9.jpg",
      rating: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Feedback',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Where are you from ?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 12),


            _buildSearchBar(),

            SizedBox(height: 16),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCityCard(
                  imagePath: 'asset/gate-of-india.png',

                  cityName: "Mumbai",
                ),
                _buildCityCard(
                  imagePath: 'asset/qutab-minar.png',
                  cityName: "Delhi NCR",
                ),
              ],
            ),

            SizedBox(height: 12),


            _buildComingSoonBanner(),

            SizedBox(height: 20),


            Text(
              "Hear from our happy members",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),


            Column(
              children: testimonials
                  .map((testimonial) => _buildTestimonialCard(testimonial))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.black54),
        hintText: "Search for your city",
        hintStyle: TextStyle(color: Colors.black45),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCityCard({required String imagePath, required String cityName}) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, height: 40),
          SizedBox(height: 8,width: 5,),
          Text(
            cityName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildComingSoonBanner() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          "Rest of the cities Coming Soon....",
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(Testimonial testimonial) {
    return Container(
      //color: Colors.white,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(testimonial.imageUrl),
                radius: 24,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Member Since ${testimonial.memberSince}",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              _buildRatingStars(testimonial.rating),
            ],
          ),
          SizedBox(height: 8),
          Text(
            testimonial.review,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(int rating) {
    return Row(
      children: List.generate(
        rating,
            (index) => Icon(Icons.star, color: Colors.amber, size: 18),
      ),
    );
  }
}

class Testimonial {
  final String name;
  final String memberSince;
  final String review;
  final String imageUrl;
  final int rating;

  Testimonial({
    required this.name,
    required this.memberSince,
    required this.review,
    required this.imageUrl,
    required this.rating,
  });
}
