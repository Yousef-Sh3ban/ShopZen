import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/configurations/app_states.dart';

import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'navigation/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsCubit.instance.loadThemeMode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit.instance,
      child: BlocBuilder<SettingsCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: SettingsCubit.instance.isDarkMode
                ? ThemeData(
                    fontFamily: "Alata",
                    
                    bottomAppBarTheme:
                        const BottomAppBarTheme(color: Colors.black),
                    primaryColor: const Color(0xFF452CE8),
                    brightness: Brightness.dark,
                    scaffoldBackgroundColor: Colors.black,
                    textTheme: const TextTheme(
                      bodyMedium: TextStyle(color: Color(0xFFDAE2FF)),
                      bodyLarge: TextStyle(color: Color(0xFF452CE8)),
                    ),
                  )
                : ThemeData(
                    fontFamily: "Alata",
                    bottomAppBarTheme:
                        const BottomAppBarTheme(color: Colors.white),
                    brightness: Brightness.light,
                    scaffoldBackgroundColor: Colors.white,
                    textTheme: const TextTheme(
                      bodyMedium: TextStyle(color: Color(0xFF323135)),
                      bodyLarge: TextStyle(color: Color(0xFF323135)),
                    ),
                  ),
            locale: SettingsCubit.instance.locale,
            onGenerateRoute: generateRoute,
            initialRoute: AppRoutes.home,
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              // AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
