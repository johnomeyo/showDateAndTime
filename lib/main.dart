import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime now = DateTime.now();
  @override
  void initState() {
    super.initState();
    // Update the time every second
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    String formattedDate = "${now.day}-${now.month}-${now.year}";
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'The date today is:',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                formattedDate,
                style: GoogleFonts.simonetta(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 50,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                'The current time is:',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                formattedTime,
                style: GoogleFonts.simonetta(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 50,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
