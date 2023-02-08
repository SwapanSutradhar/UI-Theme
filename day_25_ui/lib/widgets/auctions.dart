import 'package:day_25_ui/models/models.dart';
import 'package:day_25_ui/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAuctions extends StatefulWidget {
  const MyAuctions({super.key});

  @override
  State<MyAuctions> createState() => _MyAuctionsState();
}

class _MyAuctionsState extends State<MyAuctions> {
  final item_List = MyCategory2.generatedList1();
  var isSelected = 0;
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
        //margin: EdgeInsets.only(top: 12),
        // height: MediaQuery.of(context).size.height,
        // color: Colors.amber,
        //width: MediaQuery.of(context).size.width,
        height: double.infinity,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Auctions',
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
            height: 240,
            child: GridView.builder(
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemCount: item_List.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height,
                  width: 170,
                  //  color: Colors.amber.withOpacity(0.3),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            color: isDark
                                ? Colors.teal.withOpacity(0.2)
                                : Colors.amber.withOpacity(0.4),
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Center(
                                    child: Image.asset(
                                  item_List[index].img1,
                                  height: 90,
                                )),
                                Positioned(
                                    right: 0,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isSelected = index;
                                          });
                                        },
                                        icon: isDark
                                            ? Icon(Icons.favorite_outline)
                                            : item_List[index].icn,
                                        color: isSelected == index
                                            ? Colors.red
                                            : Colors.black.withOpacity(0.5)))
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item_List[index].name1,
                                style:
                                    myStyle(15, Colors.black, FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Current Bid',
                                        style: myStyle(
                                            14,
                                            isDark
                                                ? Colors.amber
                                                : Colors.black.withOpacity(0.5),
                                            isDark
                                                ? FontWeight.normal
                                                : FontWeight.bold),
                                      ),
                                      Text(
                                        '\$2500',
                                        style: myStyle(
                                            14,
                                            isDark ? Colors.teal : Colors.amber,
                                            FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(2.0),
                                    height: 35,
                                    width: 70,
                                    color: Colors.black,
                                    child: Center(
                                      child: Text(
                                        'Bid Now',
                                        style: myStyle(
                                            14,
                                            isDark
                                                ? Colors.teal
                                                : Colors.amber),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
