import 'package:day_25_ui/models/models.dart';
import 'package:day_25_ui/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  //const MyAppBar({super.key});
  ThemeProvider themeProvider = ThemeProvider();

  getCurrentTheme() async {
    themeProvider.setDarkTheme = await themeProvider.getTheme();
    print("X issssss${themeProvider.getDarkTheme}");
  }

  bool? xy;
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).getDarkTheme;
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hey Marvin',
                style: myStyle(30, Colors.black, FontWeight.bold),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isDark
                        ? Colors.tealAccent.withOpacity(0.5)
                        : Colors.amberAccent.withOpacity(0.3)),
                child: Stack(children: [
                  Center(
                      child: Icon(
                    Icons.notifications_outlined,
                    color:
                        isDark ? Colors.black : Colors.black.withOpacity(0.3),
                    size: 30,
                  )),
                  Positioned(
                      top: 10,
                      right: 15,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ))
                ]),
              ),
            ],
          ),
          Text(
            "Let's Make A Bid!",
            style: myStyle(
                18, isDark ? Colors.amber : Colors.black.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
