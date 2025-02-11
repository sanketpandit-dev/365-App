import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> faqItems = [
    {
      'question': 'Our 365 Care support services include',
      'answer': 'Details about 365 Care services...'
    },
    {
      'question': 'Our 365 Care support services include',
      'answer': 'Details about 365 Care services...'
    },
    {
      'question': 'Our 365 Care support services include',
      'answer': 'Details about 365 Care services...'
    },
    {
      'question': 'Our 365 Care support services include',
      'answer': 'Details about 365 Care services...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Row(
            children: [
              Icon(
                Icons.volunteer_activism_outlined,
                color: Colors.orangeAccent,
                size: 30,
              ),
              const SizedBox(width: 8),
              const Text(
                "365 CARE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(2),
              ),
              child: Container(

                height: 86,

                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                
                child: Padding(

                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Email id",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black26),
                          ),
                          Text(
                            "ABC@gmail.com",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Contact No.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black26),
                          ),
                          const Text(
                            "999898557",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Frequently Asked Question",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: faqItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: Card(

                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),

                      color: Colors.white,
                      child: ExpansionTile(

                        title: Text(
                          faqItems[index]['question']!,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(faqItems[index]['answer']!,
                                style: TextStyle(
                                  fontSize: 10,
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Image.asset("asset/help.png", height: 150),
            ),

          ],

        ),

      ),

      backgroundColor: Colors.grey[100],
    );

  }
}
