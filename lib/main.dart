import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shutter/providers/user_provider.dart';
import 'package:shutter/screens/login_screen.dart';
import 'package:shutter/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAI3Epr1gbn1knAvXyFuUzWNUtSS5focDg",
        appId: "1:649250145302:web:b50e52f836107c78f72137",
        messagingSenderId: "649250145302",
        projectId: "shutter-afacd",
        storageBucket: "shutter-afacd.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shutter',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        //home: const ResponsiveLayout(
        // mobileScreenLayout: MobileScreenLayout(),
        //webScreenLayout: WebScreenLayout(),
        //),
        home: const LoginScreen(),
        //home: SignUpScreen(),
      ),
    );
  }
}
