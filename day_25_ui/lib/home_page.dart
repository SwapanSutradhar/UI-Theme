import 'package:day_25_ui/widgets/app_bar.dart';
import 'package:day_25_ui/widgets/auctions.dart';
import 'package:day_25_ui/widgets/category.dart';
import 'package:day_25_ui/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:day_25_ui/theme_provider.dart';
//import 'package:line_icons/line_icons.dart';

class MyHomPage extends StatefulWidget {
  const MyHomPage({super.key});

  @override
  State<MyHomPage> createState() => _MyHomPageState();
}

class _MyHomPageState extends State<MyHomPage> {
  ThemeProvider themeProvider = ThemeProvider();

  getCurrentTheme() async {
    themeProvider.setDarkTheme = await themeProvider.getTheme();
    print("X issssss${themeProvider.getDarkTheme}");
  }

  bool? xy;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  /* static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Actions',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];*/

  void initState() {
    // TODO: implement initState
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).getDarkTheme;
    return Scaffold(
      backgroundColor: isDark ? Colors.white : Color(0xfff6efe5),
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          //height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                  value: isDark,
                  onChanged: (bool val) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setDarkTheme = val;
                    print("mooodd is $isDark");
                  }),
              Expanded(flex: 2, child: MyAppBar()),
              Expanded(flex: 1, child: MySearchBar()),
              Expanded(flex: 4, child: MyCategory()),
              Expanded(flex: 5, child: MyAuctions()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: isDark ? Colors.teal : Colors.amber,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              //tabBackgroundColor: Colors.grey[100]!,
              color: Colors.white.withOpacity(0.5),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.key,
                  text: 'Actions',
                ),
                GButton(
                  icon: Icons.heart_broken,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
