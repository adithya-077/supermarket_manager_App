import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_instagram_clone/dummyLoader/dummyLoader.dart';
import 'package:flutter_application_instagram_clone/provider/user_provider.dart';
import 'package:flutter_application_instagram_clone/screens/login_screen.dart';
import 'package:flutter_application_instagram_clone/screens/signup_Screen.dart';
import 'package:provider/provider.dart';

import './resposive/responsive_screen_layout.dart';
import './resposive/mobilescreen.dart';
import './resposive/webscreen.dart';
import './util/colors.dart';
import 'screens/signup_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyAVRAlOTW81SAaOCrYqIkqRlv2Lns6vppE',
            appId: '1:465153985582:web:91f0269694d918bbbe23bf',
            messagingSenderId: '465153985582',
            projectId: 'instagram-clone-a389e',
            storageBucket: "instagram-clone-a389e.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserdataProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        home: StreamBuilder(
            stream: FirebaseAuth.instance.idTokenChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                    mobileScreen: MoblieScreen(),
                    webScreen: WebScreen(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return const LoginScreen();
            }),
        routes: {
          SignupScreen.routeName: (context) => const SignupScreen(),
          Dummyloader.routName: (context) => const Dummyloader(),
        },
      ),
    );
  }
}
