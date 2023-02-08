import 'package:flutter/material.dart';
import 'package:day_25_ui/home_page.dart';
import 'package:provider/provider.dart';
import 'package:day_25_ui/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // bool isDark=Provider.of<ThemeProvider>(context).getDarkTheme;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        child: Consumer<ThemeProvider>(builder: (context, themeProvider, ch) {
          var isDark = themeProvider.getDarkTheme;
          return MaterialApp(
            /*theme: ThemeData(
              primaryColor: isDark ? Colors.teal : Colors.yellow,
              scaffoldBackgroundColor: isDark ? Colors.red : Colors.blue,
              primarySwatch: Colors.blue,
            ),*/
            debugShowCheckedModeBanner: false,
            home: const MyHomPage(),
          );
        }));
  }
}
