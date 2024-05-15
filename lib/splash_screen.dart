import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ngekos/screen/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tunggu 3 detik, kemudian navigasi ke halaman utama
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/splash.png', // Ganti dengan gambar splash screen Anda
                  height: 200, // Sesuaikan tinggi gambar dengan kebutuhan
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom:
                16, // Sesuaikan jarak teks dari bawah layar sesuai kebutuhan
            child: Center(
              child: Text(
                'Aplikasi Rekomendasi Kos No.1 di Indonesia',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
