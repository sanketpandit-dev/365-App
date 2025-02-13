import 'package:flutter/material.dart';
import 'package:healthcare/view/plandetail.dart';
import 'package:healthcare/view/plandetail1.dart';
import 'package:healthcare/view/plandetail2.dart';

class HealthPlan extends StatefulWidget {
  const HealthPlan({Key? key}) : super(key: key);

  @override
  State<HealthPlan> createState() => _HealthPlanState();
}

class _HealthPlanState extends State<HealthPlan> {
  int? _selectedLevel;

  void _onPlanSelected(int level) {
    setState(() {
      _selectedLevel = level;
    });


    if (level == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlanDetail(),
        ),
      );
    } else if (level == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => plandetail1(),
        ),
      );
    } else if (level == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlanDetail2(),
        ),
      );
    }
  }

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
        child: Center(
          child: Column(
            children: [
              CaretakerCard(
                level: 1,
                price: 30000,
                imagePath: 'asset/plan1.jpg',
                services: const ['Care Program', 'Companionship Program.'],
                color: const Color(0xFFFFF8E7),
                levelColor: Colors.orange,
                selectedLevel: _selectedLevel,
                onSelect: _onPlanSelected,
              ),
              const SizedBox(height: 5),
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
                selectedLevel: _selectedLevel,
                onSelect: _onPlanSelected,
              ),
              const SizedBox(height: 5),
              CaretakerCard(
                level: 3,
                price: 90000,
                imagePath: 'asset/plan3.jpg',
                services: const [
                  'Inhouse Mini ICU',
                  'Alzheimer Support',
                  "Parkinson's Support"
                ],
                color: const Color(0xFFE7F4FF),
                levelColor: Colors.blue,
                selectedLevel: _selectedLevel,
                onSelect: _onPlanSelected,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class CaretakerCard extends StatelessWidget {
  final int level;
  final int price;
  final String imagePath;
  final List<String> services;
  final Color color;
  final Color levelColor;
  final int? selectedLevel;
  final Function(int) onSelect;

  const CaretakerCard({
    Key? key,
    required this.level,
    required this.price,
    required this.imagePath,
    required this.services,
    required this.color,
    required this.levelColor,
    required this.selectedLevel,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onSelect(level),
      child: Container(
        width: screenWidth - 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selectedLevel == level ? levelColor : Colors.grey.withOpacity(0.2),
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(1),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
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
                          color: levelColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          'Level $level',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Radio(
                        value: level,
                        groupValue: selectedLevel,
                        onChanged: (int? value) {
                          onSelect(level);
                        },
                        activeColor: levelColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '₹$price',
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
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: services.map((service) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: levelColor,
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
      ),
    );
  }
}
