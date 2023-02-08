import 'package:day_25_ui/models/models.dart';
import 'package:day_25_ui/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  final category_list = MyCategory1.generatedList();
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
                'Categories',
                style: myStyle(26, Colors.black, FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text('See all',
                      style: myStyle(
                        18,
                        isDark
                            ? Colors.teal
                            : Colors.deepOrangeAccent.withOpacity(0.9),
                      )))
            ],
          ),
          Container(
            height: 150,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height,
                      width: 100,
                      color: isDark
                          ? Colors.tealAccent.withOpacity(0.4)
                          : Colors.amberAccent.withOpacity(0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              category_list[index].img,
                              height: 80,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            category_list[index].name,
                            style: myStyle(
                                18,
                                isDark
                                    ? Colors.amber.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.5),
                                FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (_, context) => SizedBox(
                      width: 15,
                    ),
                itemCount: category_list.length),
          )
        ],
      ),
    );
  }
}
