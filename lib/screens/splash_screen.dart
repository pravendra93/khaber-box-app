import 'package:flutter/material.dart';
import 'package:khaber_box/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();

    _simulateLoading();
  }

  void _simulateLoading() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _progress += 0.05;
        if (_progress > 1.0) _progress = 1.0;
      });
      if (_progress >= 1.0) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        });
      }
      return _progress < 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // optional
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              "assets/logo/khaberbox-logo.png",
              height: 120,
            ),
            const SizedBox(height: 30),

            // Progress bar
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _progress,
                      minHeight: 6,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xffbb0707),
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            Text(
              '${(_progress * 100).toInt()}% Loading...',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
