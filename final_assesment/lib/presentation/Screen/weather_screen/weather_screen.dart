import 'package:final_assesment/domain/domain.dart';
import 'package:final_assesment/presentation/blocs/blocs.dart';
import 'package:final_assesment/utils/icons.dart';
import 'package:final_assesment/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherModel weatherData;
  final bool isFavorite;
  const WeatherScreen(
      {super.key, required this.weatherData,required this.isFavorite});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool _isFavorite = false;

  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 27, right: 42),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    
                    context.read<WeatherBloc>().add(FetchFavoriteWeatherData());
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(backIcon)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      width: 240,
                      child: Text(
                        widget.weatherData.cityName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        softWrap: false,
                        style: const TextStyle(
                          color: Color(0xFF211772),
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppHelpers.changeDateFormat(
                        dateString: widget
                            .weatherData.dailyWeatherCondition.first.date),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isFavorite = true;
                    });
                    context.read<WeatherBloc>().add(SaveFavoriteWeatherData(
                        weatherModel: widget.weatherData));
                  },
                  icon: _isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(child: SvgPicture.asset(rainyWeatherIcon)),
            const SizedBox(height: 7),
            Text(
              widget.weatherData.weatherDescription,
              style: const TextStyle(
                color: Color(0xFF9E93FF),
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.weatherData.dailyWeatherCondition.first.maxTemperature,
                  style: const TextStyle(
                    color: Color(0xFF211772),
                    fontSize: 72,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SvgPicture.asset(ovalIcon),
                )
              ],
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 270,
        decoration: const ShapeDecoration(
          color: Color(0xFF211772),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48),
              topRight: Radius.circular(48),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x33211772),
              blurRadius: 10,
              offset: Offset(0, -4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Every day',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: widget.weatherData.dailyWeatherCondition.length,
                  itemBuilder: (context, index) {
                    var dailyWeatherData =
                        widget.weatherData.dailyWeatherCondition[index];
                    if (index == 0) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 23.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppHelpers.abbreviatedDateFormt(
                                dateString: dailyWeatherData.date),
                            style: const TextStyle(
                              color: Color(0xFFD8D8D8),
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              // height: 0.12,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${dailyWeatherData.maxTemperature}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              ),
                              const SizedBox(width: 23),
                              Text(
                                '${dailyWeatherData.minTemperature}°',
                                style: const TextStyle(
                                  color: Color(0xFFD8D8D8),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                ),
                              ),
                              const SizedBox(width: 28),
                              Image.network(
                                dailyWeatherData.weatherIconUrl,
                                height: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
