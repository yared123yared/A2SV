import 'package:final_assesment/domain/domain.dart';
import 'package:final_assesment/presentation/presentation.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weatherData;
  final bool isFavorite;
  const WeatherCard(
      {super.key, required this.weatherData, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, right: 10),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherScreen(
                isFavorite: isFavorite,
                weatherData: weatherData,
              ),
            )),
        child: Container(
          // width: 343,
          // height: 76,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  weatherData.cityName,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                '${weatherData.dailyWeatherCondition.first.maxTemperature}°',
                style: const TextStyle(
                  color: Color(0xFF211772),
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Image.network(
                weatherData.dailyWeatherCondition.first.weatherIconUrl,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
