import 'package:advicer/application/advicer/advicer_bloc.dart';
import 'package:advicer/injection.dart';
import 'package:advicer/presentation/advicer/advicer_page.dart';
import 'package:advicer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di; //! di == dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Advicer',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: BlocProvider(
            create: (BuildContext context) => sl<AdvicerBloc>(),
            child: AdvicerPage(key: key)));
  }
}
