import 'package:flutter/material.dart';
import 'package:khaber_box/provider/category_provider.dart';
import 'package:khaber_box/provider/posts_provider.dart';
import 'package:khaber_box/provider/tags_provider.dart';
import 'package:khaber_box/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => TagsProvider()),
        ChangeNotifierProvider(create: (_) => PostsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khaber Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
