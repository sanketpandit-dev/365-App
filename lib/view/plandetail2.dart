import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_plan.dart';

class PlanDetail2 extends StatelessWidget {
  PlanDetail2({super.key});

  final List<String> mylist = [
    'Companionship and emotional support',
    'Assistance in day-to-day tasks',
    'Light workouts/walking/socializing',
    'Administration of personal care, including bathing, hygiene, and ambulation',
    'Palliative Care',
    'Terminal Illness Support',
    'Post Operations',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Plan Detail',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                Color(0xFFB1D0EC),
                Colors.white,
              ],
            ),
          ),

          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                 // color: Colors.blue[100],
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        'asset/nurse.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Level 3',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue,
                              ),
                            ),
                            Text(
                              '₹90000 / per month',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '₹4500/ Daily',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.blue[50],
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Our 365 Care support services include',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mylist.length,
                      itemBuilder: (context, index) {
                        return _buildServiceTile(mylist[index]);
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Through 365 Care Buddies home support services,\n'
                          'senior citizens or vulnerable adults are provided\n'
                          'with personal care and companionship that allows\n'
                          'them to live a good quality of life in the comfort and\n'
                          'privacy of their own homes. In-home carry buddy is\n'
                          'a combination of hands-on personal care and non-\n'
                          'medical companion care.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    )

                  ],

                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildFixedButton(context),
    );
  }

  Widget _buildServiceTile(String service) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        service,
        style: const TextStyle(fontSize: 14),
        textAlign: TextAlign.center,
      ),
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
              MaterialPageRoute(builder: (context) => book_plan()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text("Buy Package >", style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}
