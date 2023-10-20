import 'package:final_assesment/domain/domain.dart';
import 'package:final_assesment/presentation/blocs/blocs.dart';
import 'package:final_assesment/presentation/presentation.dart';
import 'package:final_assesment/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await serviceLocatorInit();
  Hive.registerAdapter(DailyWeatherModelAdapter());
  Hive.registerAdapter(WeatherModelAdapter());
  Hive.registerAdapter(FavoriteWeatherAdapter());

  await Hive.openBox<FavoriteWeather>('favoriteWeather');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => serviceLocator<WeatherBloc>()
                ..add(FetchFavoriteWeatherData()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const OnBoardingScreen(),
        ));
  }
}
