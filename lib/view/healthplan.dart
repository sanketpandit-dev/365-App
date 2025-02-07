import 'package:flutter/material.dart';

class HealthPlan extends StatelessWidget {
  const HealthPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Choose care taker',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CaretakerCard(
              level: 1,
              price: 30000,
              imagePath: 'asset/plan1.jpg',
              services: const ['Care Program', 'Companionship Program.'],
              color: const Color(0xFFFFF8E7),
              levelColor: Colors.orange,
              groupValue: 1,
            ),
            const SizedBox(height: 10),
            CaretakerCard(
              level: 2,
              price: 60000,
              imagePath: 'asset/plan2.jpg',
              services: const [
                'Terminal Illness Support',
                'Post Operations',
                'Palliative Care'
              ],
              color: const Color(0xFFE7FFF8),
              levelColor: Colors.green,
              groupValue: 1,
            ),
            const SizedBox(height: 10),
            CaretakerCard(
              level: 3,
              price: 90000,
              imagePath: 'asset/plan3.jpg',
              services: const [
                'Inhouse Mini ICU',
                'Alzheimer Support',
                'Parkinson\'s Support'
              ],
              color: const Color(0xFFE7F4FF),
              levelColor: Colors.blue,
              groupValue: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class CaretakerCard extends StatefulWidget {
  final int level;
  final int price;
  final String imagePath;
  final List<String> services;
  final Color color;
  final Color levelColor;
  final int groupValue;

  const CaretakerCard({
    Key? key,
    required this.level,
    required this.price,
    required this.imagePath,
    required this.services,
    required this.color,
    required this.levelColor,
    required this.groupValue,
  }) : super(key: key);

  @override
  State<CaretakerCard> createState() => _CaretakerCardState();
}

class _CaretakerCardState extends State<CaretakerCard> {
  int? _selectedLevel;

  @override
  void initState() {
    super.initState();
    _selectedLevel = widget.groupValue;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth - 40,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _selectedLevel == widget.level
              ? widget.levelColor
              : Colors.grey.withOpacity(0.2),
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(1),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.imagePath,
              width: 80,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: widget.levelColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        'Level ${widget.level}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Radio(
                      value: widget.level,
                      groupValue: _selectedLevel,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedLevel = value;
                        });
                      },
                      activeColor: widget.levelColor,
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Text(
                  '₹${widget.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'per month',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.services.map((service) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: widget.levelColor,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              service,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
