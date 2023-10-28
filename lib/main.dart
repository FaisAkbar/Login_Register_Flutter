import 'package:flutter/material.dart';
import 'package:login_register_flutter/login.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});                         

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sumenep All Star',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 78, 10, 10)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: const LoginPage(title: 'Login Page'),
      home: const CustomSplashScreen(),
    );
  }
}

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(
            title: 'Login Screen',
          ),
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('Assets/images/logo.png'),
            const SizedBox(height: 16.0),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
