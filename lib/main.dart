
import 'package:flutter/material.dart';
import 'package:kalpas_test/home/main.dart';
import 'package:kalpas_test/user%20init/signup.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kalpas',
        theme: ThemeData(
          // This is the theme of application.
          primarySwatch: Colors.grey,
        ),
        home: const SignUp()
    );
  }
}
