import 'package:flutter/material.dart';
import 'package:stc_health_test/constants/styles.dart';
import 'login/login_vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: StcHealthStyles.primaryColor,
        useMaterial3: true,
      ),
      home: const LoginViewScreen(),
    );
  }
}
