import 'package:flutter/material.dart';

myStyle(double size, Color clr, [FontWeight? fw]) {
  return TextStyle(fontSize: size, color: clr, fontWeight: fw);
}

class MyCategory1 {
  String name;
  String img;
  MyCategory1(this.name, this.img);
  static List<MyCategory1> generatedList() {
    return [
      MyCategory1('Jewellery', 'images/1.png'),
      MyCategory1('Antiques', 'images/2.png'),
      MyCategory1('Artwork', 'images/3.png'),
      MyCategory1('Collection', 'images/1.png'),
      MyCategory1('Jewellery', 'images/2.png'),
      MyCategory1('Jewellery', 'images/1.png'),
      MyCategory1('Antiques', 'images/2.png'),
      MyCategory1('Artwork', 'images/3.png'),
      MyCategory1('Collection', 'images/1.png'),
      MyCategory1('Jewellery', 'images/2.png'),
    ];
  }
}

class MyCategory2 {
  String name1;
  String img1;
  Icon icn;
  MyCategory2(this.name1, this.img1, this.icn);

  static List<MyCategory2> generatedList1() {
    return [
      MyCategory2(
          'Shakhyamuni Bhuddha', 'images/g.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Victorian Elephant', 'images/e.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Shakhyamuni Bhuddha', 'images/g.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Victorian Elephant', 'images/e.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Shakhyamuni Bhuddha', 'images/g.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Victorian Elephant', 'images/e.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Shakhyamuni Bhuddha', 'images/g.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Victorian Elephant', 'images/e.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Shakhyamuni Bhuddha', 'images/g.png', Icon(Icons.heart_broken)),
      MyCategory2(
          'Victorian Elephant', 'images/e.png', Icon(Icons.heart_broken)),
    ];
  }
}
