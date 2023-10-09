import 'package:flutter/material.dart';

import 'app/di/di.dart';
import 'app/pages/hero_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeroListPage(),
    );
  }
}
