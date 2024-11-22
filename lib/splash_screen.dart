import 'package:avatarmakerflu/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lancer un timer pour rediriger vers l'écran principal
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CharacterSelectionScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Couleur d'arrière-plan du splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', // Votre logo ou image de splash
              height: 120,
            ),
            SizedBox(height: 20),
            Text(
              'Avatar Maker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
