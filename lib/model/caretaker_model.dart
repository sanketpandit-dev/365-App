

import 'package:flutter/material.dart';

class Caretaker {
  final String name;
  final String image;
  final double rating;
  final String experience;
  final Color ratingColor;

  Caretaker({
    required this.name,
    required this.image,
    required this.rating,
    required this.experience,
    required this.ratingColor,
  });

  factory Caretaker.fromJson(Map<String, dynamic> json) {
    return Caretaker(
      name: json['name'],
      image: 'asset/doctor2.jpg',
      rating: 4.5,
      experience: '3 Years of Experience',
      ratingColor: Colors.green,
    );
  }
}
