import 'package:asu_quickcare/screens/clinic_information_screen.dart';
import 'package:asu_quickcare/screens/doctors_list_screen.dart';
import 'package:asu_quickcare/screens/home_screen.dart';
import 'package:asu_quickcare/screens/about_screen.dart';
import 'package:asu_quickcare/screens/login_screen.dart';
import 'package:asu_quickcare/screens/register_screen.dart';
import 'package:asu_quickcare/screens/splash_screen.dart';
import 'package:asu_quickcare/screens/appointments_screen.dart';
import 'package:asu_quickcare/screens/facs_screen.dart';
import 'package:asu_quickcare/screens/support_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASU QuickCare',
      initialRoute: "/splashScreen",
      routes: {
        "/splashScreen": (context) => const SplashScreen(),
        "/loginScreen": (context) => const LoginScreen(),
        "/registerScreen": (context) => const RegisterScreen(),
        "/homeScreen": (context) => const HomeScreen(),
        "/aboutScreen": (context) => const AboutScreen(),
        "/myAppointmentsScreen": (context) => const AppointmentsScreen(),
        "/doctorsListScreen": (context) => const DoctorsListScreen(),
        "/faqsScreen": (context) => const FAQSScreen(),
        "/clinicInformationScreen": (context) =>
            const ClinicInformationScreen(),
        "/supportScreen":(context) => const Support_Screen()
      },
    );
  }
}
