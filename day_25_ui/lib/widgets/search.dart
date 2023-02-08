import 'package:day_25_ui/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearchBar extends StatelessWidget {
  //const MySearchBar({super.key});
  ThemeProvider themeProvider = ThemeProvider();

  getCurrentTheme() async {
    themeProvider.setDarkTheme = await themeProvider.getTheme();
    print("X issssss${themeProvider.getDarkTheme}");
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).getDarkTheme;
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color:
                    isDark ? Colors.tealAccent.withOpacity(0.3) : Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Items",
                      prefixIcon: Icon(Icons.search_outlined)),
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 45,
                color: isDark ? Colors.amber : Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.tune,
                  color: isDark ? Colors.black : Colors.white,
                  size: 30,
                ),
              )),
        ],
      ),
    );
  }
}
