import 'package:berita/providers/news.provider.dart';
import 'package:berita/providers/news.provider2.dart';
import 'package:berita/providers/news.provider3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider2()),
        ChangeNotifierProvider(create: (_) => NewsProvider3()), // Tambahkan koma di sini
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      ),
    );
  }
}
