import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/caretaker_model.dart';

class CaretakerController {
  Future<List<Caretaker>> fetchCaretakers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Caretaker> caretakers = data.map((json) => Caretaker.fromJson(json)).toList();


      return [
        Caretaker(name: caretakers[0].name, image: 'asset/doctor1.jpg', rating: 4.5, experience: '3 Years of Experience', ratingColor: Colors.green),
        Caretaker(name: caretakers[1].name, image: 'asset/doctor2.jpg', rating: 4.0, experience: '5 Years of Experience', ratingColor: Colors.blue),
        Caretaker(name: caretakers[2].name, image: 'asset/doctor3.jpg', rating: 3.5, experience: '2 Years of Experience', ratingColor: Colors.orange),
        Caretaker(name: caretakers[3].name, image: 'asset/doctor4.png', rating: 2.5, experience: '1 Year of Experience', ratingColor: Colors.red),
        Caretaker(name: caretakers[4].name, image: 'asset/doctor2.jpg', rating: 4.7, experience: '4 Years of Experience', ratingColor: Colors.green),
      ];
    } else {
      throw Exception('Failed to load caretakers');
    }
  }
}
