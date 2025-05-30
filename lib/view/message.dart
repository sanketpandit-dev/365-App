import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class message extends StatelessWidget {
  const message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Message", style: TextStyle(fontSize: 20),),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Message Found',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),

            Image.asset('asset/no-message.png',
              height: 120,
            ),

          ],


        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {

        },
        child: Icon(Icons.message,

        ),
      )
    );
  }
}
