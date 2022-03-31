import 'package:flutter/material.dart';

import 'pages/recipe_list/recipe_list_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reciperlich',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const RecipeListPage(),
    );
  }
}
