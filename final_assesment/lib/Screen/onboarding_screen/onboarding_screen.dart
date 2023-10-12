import 'package:final_assesment/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../choose_city/choose_city.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF3C2CB9), Color(0xFF211772)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 143),
            SvgPicture.asset(rainyLightIcon),
            SizedBox(height: 67),
            const Text(
              'Weather',
              style: TextStyle(
                color: Color(0xFFFFBA25),
                fontSize: 44,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            SizedBox(height: 4),
            const Text(
              'Forecast App.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 23),
            const SizedBox(
              width: 302,
              height: 60,
              child: Text(
                'It\'s the newest weather app. It has a bunch of features \n and that includes most of the ones that every weather app has.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  // height: 0.14,
                ),
              ),
            ), 
            const SizedBox(height: 42),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseCity())),
              child: Container(
                width: 220,
                height: 48,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFFBA25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child:  Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
