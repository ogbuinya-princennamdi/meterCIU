import 'package:flutter/material.dart';

class LoadingLogo extends StatefulWidget {
  const LoadingLogo({super.key});

  @override
  _RotatingImageState createState() => _RotatingImageState();
}

class _RotatingImageState extends State<LoadingLogo> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotationTransition(
          turns: _controller,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(2.0), // Padding around the border
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50), // Clip the image to match the border radius
                child: Image.asset(
                  'assets/litmac.png', // Correct asset path
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover, // Ensure the image covers the container
                ),
              ),
            ),
          ),
        ),
        const Text(
          'Safety in Privacy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 18,
            color: Colors.white
          ),
        ),
      ],
    );
  }
}
