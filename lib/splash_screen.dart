import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieSplashScreen extends StatefulWidget {
  @override
  _LottieSplashScreenState createState() => _LottieSplashScreenState();
}

class _LottieSplashScreenState extends State<LottieSplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(
        Duration(seconds: 5)); // assuming a 5 second delay, adjust as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset('assets/pskor2.json'),
      ),
    );
  }
}

class YourNextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Screen')),
      body: Center(child: Text('Welcome to the next screen!')),
    );
  }
}
