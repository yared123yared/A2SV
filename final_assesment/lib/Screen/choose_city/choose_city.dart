import 'package:final_assesment/Screen/weather_screen/weather_screen.dart';
import 'package:flutter/material.dart';

class ChooseCity extends StatelessWidget {
  const ChooseCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4FF),
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: const Text(
          'Choose a city',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF211772),
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 5),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                Container(
                  width: 265,
                  height: 48,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextField(
                    autofocus: true,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                    width: 84,
                    height: 36,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFFBA25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Search',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(height: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Fav Cities',
                  style: TextStyle(
                    color: Color(0xFF211772),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherScreen(),)),
                              child: Container(
                                width: 343,
                                height: 76,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Text(
                                      'New Mexico, USA',
                                      style: TextStyle(
                                        color: Color(0xFF575757),
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 0.07,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
