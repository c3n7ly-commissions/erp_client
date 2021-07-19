import 'package:flutter/material.dart';
import 'pages/auth/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qubes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        cardTheme: CardTheme(
          elevation: 0,
        ),
      ),
      initialRoute: '/sign-in',
      routes: {
        // auth
        '/sign-in': (context) => SignInScreen(),
        // '/forgot-password': (context) => PasswordResetScreen(),
        // '/reset-email-sent': (context) => ResetEmailSentScreen(),
        // '/create-new-password': (context) => CreatePasswordScreen(),
        //
        // -----------
        // landing
        // '/splash': (context) => SplashScreen(),
        //
      },
    );
  }
}
