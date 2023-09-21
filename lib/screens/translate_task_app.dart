import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translate_module/cubit/t_and_c_cubit.dart';
import 'package:translate_module/repositories/t_c_repository.dart';
import 'package:translate_module/screens/terms_and_condition_scren.dart';
import 'package:translate_module/utils/app_routes.dart';
import 'package:translate_module/utils/color_schemes.g.dart';

/// TranslateTaskApp is the root widget of the application
class TranslateTaskApp extends StatefulWidget {
  const TranslateTaskApp({super.key});

  @override
  State<TranslateTaskApp> createState() => _TranslateTaskAppState();
}

class _TranslateTaskAppState extends State<TranslateTaskApp> {
  /// [build] is the method that builds the widget
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsAndConditionCubit(
        termsAndConditionRepository: TermsAndConditionRepository(),
      )..getData(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        initialRoute: AppRoutes.root,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRoutes.generateRoute,
        home: MyTermsAndConditionsScreen(),
      ),
    );
  }
}
