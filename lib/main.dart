import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translate_module/screens/translate_task_app.dart';
import 'package:translate_module/utils/my_global_observer.dart';

/// [main] is the entry point of the application
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyGlobalObserver();

  /// [runApp] is the method that runs the application
  /// [TranslateTaskApp] is the root widget of the application
  runApp(const TranslateTaskApp());
}
