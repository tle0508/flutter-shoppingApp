import 'package:flutter/material.dart';
import 'package:widgets/di/get_it.dart';
import 'package:widgets/router/go_router.dart';


void main() {
  registerServices();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 147, 0, 0)),
        useMaterial3: true,
      ),
    );
  }
}
