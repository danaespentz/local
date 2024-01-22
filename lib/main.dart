import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local/colors.dart';
import 'package:local/mobile_screen_layout.dart';
import 'package:local/provider/user_provider.dart';
//import 'package:local/mobile_screen_layout.dart';
//import 'package:local/responsive_layout_screen.dart';
import 'package:local/screens/login_screen.dart';
import 'package:provider/provider.dart';
//import 'package:local/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCcYTgA3qL7VBmnQTCJ9c6Yo5nwTN2DMWQ",
            appId: "1:706950577855:web:c5ea1527b06a402ebd100a",
            messagingSenderId: "706950577855",
            projectId: "local-16caf",
            storageBucket: "local-16caf.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Local',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const MobileScreenLayout();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
              return const LoginForm();
            }),
      ),
    );
  }
}
