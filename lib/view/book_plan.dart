import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class book_plan extends StatefulWidget {
  const book_plan({super.key});

  @override
  State<book_plan> createState() => _BookingCompletedScreenState();
}

class _BookingCompletedScreenState extends State<book_plan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color(0xFFFFE5C4),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 320,

              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'asset/nurse.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ScaleTransition(
                scale: _scaleAnimation,
                // child: Container(
                //   padding: const EdgeInsets.all(20),
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.green.shade300,
                //   ),
                //   child: const Icon(
                //     Icons.verified_rounded,
                //     size: 80,
                //     color: Colors.white,
                //   ),
                // ),
                child: Image.asset(
                  'asset/check.png',
                  height: 70,

                )),
            const SizedBox(height: 35),
            const Text(
              "Booking Completed",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.grey),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "View Details",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
