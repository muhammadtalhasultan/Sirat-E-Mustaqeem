import 'dart:math';

class ImageOfTheDay {
  static final List<String> _imagePath = [
    'assets/images/image_of_the_day/1.jpg',
    'assets/images/image_of_the_day/2.jpg',
    'assets/images/image_of_the_day/3.png',
    'assets/images/image_of_the_day/4.jpg',
    'assets/images/image_of_the_day/5.jpg',
    'assets/images/image_of_the_day/6.jpg',
  ];

  static String get selectedImagePath {
    return _imagePath[Random().nextInt(_imagePath.length)];
  }
}
