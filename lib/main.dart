import 'package:flutter/material.dart';
import 'package:ngekos/screen/home_page.dart';
import 'package:provider/provider.dart';
import 'package:ngekos/screen/provider/product_provider.dart';
import 'splash_screen.dart';
import 'auth/signin_page.dart';
import 'auth/signup_page.dart';
import 'screen/profile_page.dart';
import 'screen/search_page.dart';
import 'screen/chat_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xfeartdcudwhaussamfr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmZWFydGRjdWR3aGF1c3NhbWZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU3MTQ2ODgsImV4cCI6MjAzMTI5MDY4OH0.vq87HAQISZcpBAv2xAhfFCC-d7T0ZvTKfwoiuHa-cPM',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        // Provider untuk state otentikasi jika diperlukan
      ],
      child: MaterialApp(
        title: 'Simple App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/homepage': (context) =>
              supabase.auth.currentSession != null ? HomePage() : SignInPage(),
          '/search': (context) => SearchPage(),
          '/chat': (context) => ChatPage(),
          '/profile': (context) => ProfilePage(),
          '/signin': (context) => SignInPage(),
          '/signup': (context) => SignUpPage(),
        },
        home: supabase.auth.currentSession != null ? HomePage() : SignInPage(),
      ),
    );
  }
}
