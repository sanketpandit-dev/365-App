import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class book_plan extends StatelessWidget {
  const book_plan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Book Plan',
    )
    )
    );
  }
}
